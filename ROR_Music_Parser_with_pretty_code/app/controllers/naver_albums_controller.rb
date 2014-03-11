class NaverAlbumsController < AlbumsController
  # inherit from AlbumsController
  
  def index
    # show all naver albums
    @naver_albums = NaverAlbum.where(content_provider: "N")
  end

  def show
    # show one album
    # NOT necessary : using "albums#show"
  end

  def new
    # get new data from Naver Music

    # using class method
    @naver_albums = NaverAlbum.get_albums("http://music.naver.com/todayMusic/index.nhn?startDate=20140210")

    @naver_albums.each do |naver_album|
      NaverAlbum.create(title: naver_album["title"], 
                        artist: naver_album["artist"],
                        youtube_hash: naver_album["youtube_hash"],
                        content_provider: "N")
    end

    render 'index'
  end

  def create
    # create a album
    # NOT necessary : using "albums#create"
  end
end
