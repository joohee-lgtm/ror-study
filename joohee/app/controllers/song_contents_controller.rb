class SongContentsController < ApplicationController
  before_action :set_song_content, only: [:show, :edit, :update, :destroy]

  # GET /song_contents
  # GET /song_contents.json
  def index
    @song_contents = SongContent.all
  end

  # GET /song_contents/1
  # GET /song_contents/1.json
  def show
  end

  # GET /song_contents/new
  def new
    @song_content = SongContent.new
  end

  # GET /song_contents/1/edit
  def edit
  end

  # POST /song_contents
  # POST /song_contents.json
  def create
    @song_content = SongContent.new(song_content_params)

    respond_to do |format|
      if @song_content.save
        format.html { redirect_to @song_content, notice: 'Song content was successfully created.' }
        format.json { render action: 'show', status: :created, location: @song_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @song_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /song_contents/1
  # PATCH/PUT /song_contents/1.json
  def update
    respond_to do |format|
      if @song_content.update(song_content_params)
        format.html { redirect_to @song_content, notice: 'Song content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @song_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /song_contents/1
  # DELETE /song_contents/1.json
  def destroy
    @song_content.destroy
    respond_to do |format|
      format.html { redirect_to song_contents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song_content
      @song_content = SongContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_content_params
      params.require(:song_content).permit(:origin_url, :singer, :album_title, :song_title, :content)
    end
end
