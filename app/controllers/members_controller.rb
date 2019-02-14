class MembersController < ApplicationController
    get '/signup' do
        erb :create_member
    end

    post '/signup' do
        
    end

    get '/login' do
        erb :login
    end

    post '/login' do

    end

    get '/logout' do

    end
end