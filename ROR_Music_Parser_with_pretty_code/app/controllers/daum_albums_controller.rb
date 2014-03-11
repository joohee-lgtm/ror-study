class DaumAlbumsController < AlbumsController
  # inherit from AlbumsController
  
  def index
    # show all daum albums
    @daum_albums = DaumAlbum.where(content_provider: "D")
  end

  def show
    # show one album
    # NOT necessary : using "albums#show"
  end

  def new
    # get new data from daum Music

    # using class method
    @daum_albums = DaumAlbum.get_albums("http://music.daum.net/chart/chartsong/list")

    @daum_albums.each do |daum_album|
      DaumAlbum.create(title: daum_album["title"], 
                        artist: daum_album["artist"],
                        youtube_hash: daum_album["youtube_hash"],
                        content_provider: "D")
    end

    render 'index'
  end

  def create
    # create a album
    # NOT necessary : using "albums#create"
  end
end
