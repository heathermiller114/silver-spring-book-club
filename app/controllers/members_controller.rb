class MembersController < ApplicationController
    get '/signup' do
        if !logged_in?
            erb :'members/create_member'
        end
    end

    post '/signup' do
        if params[:email] == "" || params[:password] == ""
            redirect "/signup"
        else
            @member = Member.new(email: params[:email], password: params[:password])
            @member.save
            session[:member_id] = @member.id

            #redirect
        end
        
    end

    get '/login' do
        erb :'members/login'
    end

    post '/login' do

    end

    get '/logout' do

    end
end