class ReviewsController < ApplicationController
    #Create
    get '/reviews/new' do
        if logged_in?
            @books = Book.all
            erb :'reviews/new'
        else
            redirect '/login'
        end
    end

    post '/reviews' do

    end

    #Read
    get '/reviews/:id' do

    end

    #Update
    get '/reviews/:id/edit' do

    end

    patch '/reviews/:id' do

    end

    #Delete
    delete '/reviews/:id/delete' do
        
    end
end