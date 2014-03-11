class Album < ActiveRecord::Base
  extend Crawler # Web Crawling
  extend YoutubeParser # Youtube Parsing
  extend AlbumsHelper # Generating Youtube URLs : search, watch, embed, thumbmail


  # Validation
  #   - all colums must be present
  #   - youtube hash must be unique
  #   - [title, artist] pair must be unique

  validates :title, presence: true
  validates :artist, presence: true
  validates :content_provider, presence: true

  validates :youtube_hash, presence: true,
                            uniqueness: true
  validates_uniqueness_of :title, scope: [:artist]


  # Template Method = similar to pure virtual function or Interface
  #   - must be override by CONTENT_PROVIDER_album model
  #   - must define process sequence
  #     - 1. crawl from CONTENT_PROVIDER page
  #     - 2. parse : get title, artist
  #     - 3. search and crawl from Youtube
  #     - 4. parse : get youtube hash
  

  # Where is get_albums_from_youtube ?
  #   - this module is common for all album models
  #   - find this at app/model/concerns/youtube_parser.rb
  #   
  #   - # PROCESS 3 : Search and Crawl from Youtube
  #   - # PROCESS 4 : Parse : youtube hash
  
  def get_albums
    get_albums_from_content_provider # 1, 2
    get_albums_from_youtube # 3, 4
  end

  def get_albums_from_content_provider
    # PROCESS 1 : Crawl from CONTENT_PROVIDER
    # PROCESS 2 : Parse : title and artist

    parse_title
    parse_artist
  end

  def parse_title
  end

  def parse_artist
  end
end
