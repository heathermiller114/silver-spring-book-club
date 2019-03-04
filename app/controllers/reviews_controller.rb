class ReviewsController < ApplicationController
    #Create
    #get '/reviews/new' do
    #    if logged_in?
    #        @books = Book.all
    #        erb :'reviews/new'
    #    else
    #        redirect '/login'
    #    end
    #end

    #post '/reviews' do
    #    if params[:content].empty?
    #        redirect "/reviews/new"
    #    else
    #        @review = Review.new(content: params[:content])
    #        @review.member_id = current_member.id
#
    #        @books = Book.all
    #        this_book = @books.find {|book| book.title == params[:book]}
    #        @review.book_id = this_book.id
#
    #        @review.save
#
    #        redirect "/books"
    #    end
    #end

    #Update
    get '/reviews/:id/edit' do
        #binding.pry
        @review = Review.find_by(id: params[:id])
        @book = Book.find_by(id: @review.book_id)

        if !logged_in?
            redirect "/login"
        elsif logged_in? && @review && @review.member_id == current_member.id
            erb :'reviews/edit_review'
        else
            redirect "/books/#{@book.slug}"
        end
    end

    patch '/reviews/:id' do
        #binding.pry
        @review = Review.find_by(id: params[:id])
        @book = Book.find_by(id: @review.book_id)
        if params[:content].empty?
            redirect "/reviews/#{review.id}/edit"
        else
            @review.update(content: params[:content])

            redirect "/books/#{@book.slug}"
        end
    end

    #Delete
    delete '/reviews/:id/delete' do
        #binding.pry
        review = Review.find_by(id: params[:id])
        book = Book.find_by(id: review.book_id)
        if !logged_in?
            redirect '/login'
        elsif logged_in? && review && review.member_id == current_member.id
            review.delete
            redirect "/books/#{book.slug}"
        else
            redirect "/books/#{book.slug}"
        end
    end
end