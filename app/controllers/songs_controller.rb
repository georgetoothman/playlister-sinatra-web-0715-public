class SongsController < ApplicationController
  get '' do
    @songs = Song.all
    erb :"songs/index"
  end

  # should be before /slug
  get '/new' do
    @genres = Genre.all
    erb :"songs/new"
  end

  post '' do
    s = Song.create(params[:song])
    flash[:notice] = "Successfully created song."
    redirect "/songs/#{s.slug}"
  end

  get "/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  get "/:slug/edit" do
    @genre = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

  patch "/:slug" do
    s = Song.find_by_slug(params[:slug])
    s.update(params[:song])
    flash[:notice] = "Song successfully updated."
    redirect "/songs/#{s.slug}"
  end
end