json.array!(@albums) do |album|
  json.extract! album, :id, :origin_url, :singer, :album_title, :song_title, :content
  json.url album_url(album, format: :json)
end
