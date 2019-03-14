class ReviewsController < ApplicationController

    #Update
    get '/reviews/:id/edit' do
        #binding.pry
        redirect_if_not_logged_in
        @review = Review.find_by(id: params[:id])
        @book = Book.find_by(id: @review.book_id)

        if logged_in? && @review && @review.member_id == current_member.id
            erb :'reviews/edit_review'
        else
            redirect "/books/#{@book.slug}"
        end
    end

    patch '/reviews/:id' do
        redirect_if_not_logged_in
        #binding.pry
        @review = Review.find_by(id: params[:id])
        @book = Book.find_by(id: @review.book_id)
        if params[:content].empty?
            redirect "/reviews/#{review.id}/edit"
        else
            if logged_in? && @review.member_id == current_member.id
                @review.update(content: params[:content])

                redirect "/books/#{@book.slug}"
            end
        end
    end

    #Delete
    delete '/reviews/:id/delete' do
        redirect_if_not_logged_in
        #binding.pry
        review = Review.find_by(id: params[:id])
        book = Book.find_by(id: review.book_id)

        if logged_in? && review && review.member_id == current_member.id
            review.delete
            redirect "/books/#{book.slug}"
        else
            redirect "/books/#{book.slug}"
        end
    end
end