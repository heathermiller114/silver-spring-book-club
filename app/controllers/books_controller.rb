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