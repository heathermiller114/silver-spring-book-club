class MembersController < ApplicationController
    get '/signup' do
        if !logged_in?
            @member = Member.new
            erb :'members/create_member'
        end
    end

    post '/signup' do
        #can get rid of next line due to validations
        @member = Member.new(email: params[:email], password: params[:password])
        #binding.pry
        if @member.valid?
            @member.save
            session[:member_id] = @member.id
            redirect "/books"
        else
            #binding.pry
            redirect "/signup"
        end
    end

    get '/login' do
        if !logged_in?
            erb :'members/login'
        else
            redirect "/books"
        end
    end

    post '/login' do
        @member = Member.find_by(email: params[:email])

        if @member && @member.authenticate(params[:password])
            session[:member_id] = @member.id
            redirect "/books"
        else
            redirect "/login"
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect "/login"
        else
            redirect "/login"
        end
    end
end