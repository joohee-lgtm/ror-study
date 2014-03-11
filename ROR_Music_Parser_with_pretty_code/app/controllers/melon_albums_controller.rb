class MelonAlbumsController < AlbumsController
  # inherit from AlbumsController
  
  def index
    # show all melon albums
    @melon_albums = MelonAlbum.where(content_provider: "M")
  end

  def show
    # show one album
    # NOT necessary : using "albums#show"
  end

  def new
    # get new data from melon Music

    # using class method
    @melon_albums = MelonAlbum.get_albums("http://www.melon.com/cds/chart/web/chartrealtime_list.htm")

    @melon_albums.each do |melon_album|
      MelonAlbum.create(title: melon_album["title"], 
                        artist: melon_album["artist"],
                        youtube_hash: melon_album["youtube_hash"],
                        content_provider: "M")
    end

    render 'index'
  end

  def create
    # create a album
    # NOT necessary : using "albums#create"
  end
end
