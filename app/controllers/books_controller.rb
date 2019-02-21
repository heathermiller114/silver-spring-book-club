class BooksController < ApplicationController
    get '/books' do
        if !logged_in?
            redirect "/login"
        else
            @books = Book.all
            erb :'books/books'
        end
    end

    #Create
    get '/books/new' do
        if !logged_in?
            redirect "/login"
        else
            erb :'books/new'
        end
    end

    post '/books' do
        #binding.pry
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
        @reviews = Review.all
        if logged_in?
            @book = Book.find_by_slug(params[:slug])
            #binding.pry
            erb :'books/show'
        else
            redirect "/login"
        end
    end

    #Update
    get '/books/:slug/edit' do
        #binding.pry
        @book = Book.find_by_slug(params[:slug])
        if !logged_in?
            redirect '/login'
        elsif logged_in? && @book && @book.member_id == current_member.id
            erb :'books/edit_book'
        else
            redirect "/books/#{@book.slug}"
        end
    end

    patch '/books/:slug' do
        @book = Book.find_by_slug(params[:slug])
        if params[:title].empty? || params[:author].empty? || params[:page_count].empty? || params[:plot].empty? || params[:genre].empty?
            redirect "/books/#{@book.slug}/edit"
        else
            @book.update(title: params[:title])
            @book.update(author: params[:author])
            @book.update(page_count: params[:page_count])
            @book.update(plot: params[:plot])
            @book.update(genre: params[:genre])

            redirect "/books/#{@book.slug}"
        end
    end

    #Delete
    delete '/books/:slug/delete' do
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