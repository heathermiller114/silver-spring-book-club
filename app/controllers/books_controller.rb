class BooksController < ApplicationController
    get '/books' do
        redirect_if_not_logged_in
        @books = Book.all
        erb :'books/books'
    end

    #Create
    get '/books/new' do
        redirect_if_not_logged_in
        erb :'books/new'
    end

    post '/books' do
        #binding.pry
        redirect_if_not_logged_in
        if params[:title].empty? || params[:author].empty? || params[:page_count].empty? || params[:plot].empty? || params[:genre].empty?
            redirect "/books/new"
        else
            @book = Book.create(params)
            @book.member_id = current_member.id
            #binding.pry
            @book.save

            redirect "/books"
        end
    end

    #Read
    get '/books/:slug' do
        redirect_if_not_logged_in
        @book = Book.find_by_slug(params[:slug])
            #binding.pry
        erb :'books/show'
    end

    post '/books/:slug' do
        redirect_if_not_logged_in
        @book = Book.find_by_slug(params[:slug])
        #binding.pry
        if params[:content].empty?
            redirect "/books/#{@book.slug}"
        else
            @review = @book.reviews.build(content: params[:content], member_id: current_member.id)
            @review.save

            redirect "/books/#{@book.slug}"
        end

    end

    #Update
    get '/books/:slug/edit' do
        #binding.pry
        redirect_if_not_logged_in
        @book = Book.find_by_slug(params[:slug])
        if logged_in? && @book && @book.member_id == current_member.id
            erb :'books/edit_book'
        else
            redirect "/books/#{@book.slug}"
        end
    end

    patch '/books/:slug' do
        redirect_if_not_logged_in
        @book = Book.find_by_slug(params[:slug])
        if params[:title].empty? || params[:author].empty? || params[:page_count].empty? || params[:plot].empty? || params[:genre].empty?
            redirect "/books/#{@book.slug}/edit"
        else
            if logged_in? && @book && @book.member_id == current_member.id
                @book.update(title: params[:title])
                @book.update(author: params[:author])
                @book.update(page_count: params[:page_count])
                @book.update(plot: params[:plot])
                @book.update(genre: params[:genre])

            end
            redirect "/books/#{@book.slug}" 
        end
    end

    #Delete
    delete '/books/:slug/delete' do
        redirect_if_not_logged_in
        book = Book.find_by_slug(params[:slug])

        if !logged_in?
            redirect '/login'
        elsif logged_in? && book && book.member_id == current_member.id
            book.delete
            redirect '/books'
        else
            redirect "/books/#{book.slug}"
        end
    end

end