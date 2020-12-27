class AlbumsController < ApplicationController

  get '/albums' do 
    erb :'albums/index'
  end

  get '/albums/new' do 
    erb :'albums/new'
  end

  post '/albums' do
    if logged_in?
      @album = Album.find_or_create_by(:name => params[:name])
      @album.artist = Artist.find_or_create_by(:name => params[:artist])
      @album.genre = params[:genre]
      @album.year_released = params[:year_released]
      @album.notes = params[:notes]
      @album.save
      current_user.albums << @album
      redirect "/albums/#{@album.id}"
    else
      redirect "/login"
    end
  end

    get '/albums/:id' do 
      if logged_in?
        @album = Album.find(params[:id])
        erb :'/albums/show'
      else
        redirect '/login'
      end
    end

end