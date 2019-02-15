class BooksController < ApplicationController
    get '/books' do
        if !logged_in?
            redirect "/login"
        else
            erb :'books/books'
        end
    end

    #Create
    get '/books/new' do

    end

    post '/books' do

    end

    #Read
    get '/books/:id' do

    end

    #Update
    get '/books/:id/edit' do

    end

    patch '/books/:id' do

    end

    #Delete
    delete '/books/:id/delete' do
        
    end


end