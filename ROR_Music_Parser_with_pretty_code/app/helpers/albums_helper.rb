module AlbumsHelper
  SEARCH_URL_WITHOUT_QUERY = "http://www.youtube.com/results?search_query="
  WATCH_URL_WITHOUT_HASH = "http://www.youtube.com/watch?v="
  EMBED_URL_WITHOUT_HASH = "http://www.youtube.com/embed/"
  THUMBNAIL_URL_WITHOUT_HASH = "http://i1.ytimg.com/vi/"
  THUMBNAIL_FILENAME = "mqdefault.jpg"

  def get_youtube_search_url(title = "", artist = "")
    # title(string), artist(string) -> search_url(string)
    URI.encode(SEARCH_URL_WITHOUT_QUERY + title.to_s + "+" + artist.to_s)
  end

  def get_youtube_watch_url(hash)
    # hash(string) -> watch_url(string)
    WATCH_URL_WITHOUT_HASH + hash.to_s
  end

  def get_youtube_embed_url(hash)
    # hash(string) -> embed_url(string)
    EMBED_URL_WITHOUT_HASH + hash.to_s
  end

  def get_youtube_thumbnail(hash)
    # hash(string) -> thumbnail_url(string)
    THUMBNAIL_URL_WITHOUT_HASH + hash.to_s + "/" + THUMBNAIL_FILENAME
  end

  def get_content_provider_full_name(content_provider_short_name)
    content_provider_full_name = case content_provider_short_name
                                   when "N" then "Naver Music"
                                   when "M" then "Melon Music"
                                   when "D" then "Daum Music"
                                 end
  end
end
