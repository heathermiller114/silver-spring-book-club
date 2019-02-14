require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:member_id]
    end

    def current_member
      Member.find(session[:member_id])
    end
  end
end
