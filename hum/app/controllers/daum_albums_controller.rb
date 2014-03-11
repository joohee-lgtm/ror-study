class DaumAlbumsController < ApplicationController
  before_action :set_daum_album, only: [:show, :edit, :update, :destroy]

  # GET /daum_albums
  # GET /daum_albums.json
  def index
    @daum_albums = DaumAlbum.all
    puts "index"
  end

  # GET /daum_albums/1
  # GET /daum_albums/1.json
  def show
  end

  # GET /daum_albums/new
  def new
    @daum_album = DaumAlbum.new
  end

  # GET /daum_albums/1/edit
  def edit
  end

  # POST /daum_albums
  # POST /daum_albums.json
  def create
    @daum_album = DaumAlbum.new(daum_album_params)

    respond_to do |format|
      if @daum_album.save
        format.html { redirect_to @daum_album, notice: 'Daum album was successfully created.' }
        format.json { render action: 'show', status: :created, location: @daum_album }
      else
        format.html { render action: 'new' }
        format.json { render json: @daum_album.errors, status: :unprocessable_entity }
      end
    end
  end

  def crawl
    puts "crawl call"
    require 'open-uri'
    require 'nokogiri'

    url = "http://music.daum.net/imagene/detail?award_id=381"
    source = Nokogiri::HTML(open(url))

    @parsed_albums = [];
    #puts source
    albums = source.css('.wrap_album')
    albums.each do |album|
      title = album.css('.tit_album a')[0]['title']
      image_name = album.css('.box_album a img')[0]['src']
      review_writer = album.css('.cont_review .tit').text
      review = album.css('.cont_review .desc p').text

      parsed_album = {title: title,
                      image_name: image_name,
                      review_writer: review_writer,
                      review: review};

      @parsed_albums.push(parsed_album);
    end

    #puts parsed_albums.inspect

    render "crawl"
  end

  # PATCH/PUT /daum_albums/1
  # PATCH/PUT /daum_albums/1.json
  def update
    respond_to do |format|
      if @daum_album.update(daum_album_params)
        format.html { redirect_to @daum_album, notice: 'Daum album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @daum_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daum_albums/1
  # DELETE /daum_albums/1.json
  def destroy
    @daum_album.destroy
    respond_to do |format|
      format.html { redirect_to daum_albums_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daum_album
      @daum_album = DaumAlbum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daum_album_params
      params.require(:daum_album).permit(:artist, :title, :image_name, :review_writer, :review)
    end
end
