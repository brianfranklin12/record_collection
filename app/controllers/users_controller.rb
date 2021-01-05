class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect '/albums'
    end
  end

  post '/signup' do 
    if (params[:username] != "") && (params[:password] != "")
      user = User.create(params)
      session[:user_id] = user.id
      redirect '/albums'
    else
      if params[:username] == ""
        session[:error] = "Username cannot be blank"
      else
        session[:error] = "Password cannot be blank"
      end
      redirect '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/albums'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/albums'
    else
      session[:error] = "Username and password combo not found"
      redirect '/login'
    end
  end

  get '/logout' do 
    session.clear
    redirect '/login'
  end

end