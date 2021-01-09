class AlbumsController < ApplicationController

  get '/albums' do 
    erb :'albums/index'
  end

  get '/albums/list' do
    erb :'albums/list'
  end

  get '/albums/new' do 
    erb :'albums/new'
  end

  post '/albums' do
    if logged_in?
      @album = Album.find_or_create_by(:name => params[:name])
      @album.user = current_user 
      @album.artist = Artist.find_or_create_by(:name => params[:artist])
      @album.genre = params[:genre]
      @album.year_released = params[:year_released]
      @album.notes = params[:notes]
      @album.image_url = @album.get_coverart
      @album.save
      redirect "/albums/#{@album.id}"
    else
      redirect "/login"
    end
  end

    get '/albums/:id' do
      if logged_in?
        @album = Album.find_by(:id => params[:id])
        if current_user.id == @album.user_id
          erb :'/albums/show'
        else
          redirect '/albums'
        end
      else
        redirect '/login'
      end
    end

    get '/albums/:id/edit' do 
      if logged_in?
        @album = Album.find_by(:id => params[:id])
        if current_user.id == @album.user_id
          erb :'/albums/edit'
        else
          redirect '/albums'
        end
      else
        redirect '/login'
      end
    end

    patch '/albums/:id' do
      if logged_in?
        @album = Album.find_by(:id => params[:id])
        @album.artist = Artist.find_or_create_by(:name => params[:artist])
        @album.genre = params[:genre]
        @album.year_released = params[:year_released]
        @album.notes = params[:notes]
        @album.save
        redirect "/albums/#{@album.id}"
      else
        redirect '/login'
      end
    end

    delete '/albums/:id/delete' do
      if logged_in?
        @album = Album.find_by(:id => params[:id])
        if @album.user == current_user
          @album.destroy
          redirect '/albums'
        else
          redirect '/albums'
        end
      else
        redirect '/login'
      end
    end

end