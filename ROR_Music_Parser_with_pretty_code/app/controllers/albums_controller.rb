class AlbumsController < ApplicationController
  def index
    # show all albums
    @albums = Album.all
  end

  def show
    # show one album
  end

  # new -> create
  def new
    # NOT necessary
    # add a album
  end

  def create
    # create a album
    
    # implementation for AJAX
    album = Album.get_album_from_youtube params[:custom_album_query]
    data = { youtube_hash: album["youtube_hash"] }
    render json: album.to_json
  end
end
