class NaverAlbum < Album
  # inherit from Album Model

  def self.get_albums(url) #using class method
    @albums = Array.new(5){ Hash.new }

    # PROCESS 1 : Crawl from Naver
    # PROCESS 2 : Parse 
    get_albums_from_content_provider(@albums, crawl_from(url).css(".tm_section"))
    
    # PROCESS 3 : Search and Crawl from Youtube
    # PROCESS 4 : Parse
    get_albums_from_youtube(@albums)
  end


  # Implementation of Template
  def self.get_albums_from_content_provider(albums, source)
    albums.each_with_index do |album, index|
      album["title"] = parse_title source[index+1]
      album["artist"] = parse_artist source[index+1]

      # why parse form index+1?
      #   - source[0] is a dummy info
    end
  end

  def self.parse_title(source)
    source.css(".name").css("._title")[0]["title"]
  end

  def self.parse_artist(source)
    source.css("tbody td ._artist").css("._artist")[0]["title"]
  end

end
