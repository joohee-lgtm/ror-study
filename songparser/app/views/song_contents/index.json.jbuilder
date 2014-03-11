json.array!(@song_contents) do |song_content|
  json.extract! song_content, :id, :origin_url, :singer, :album, :content, :song
  json.url song_content_url(song_content, format: :json)
end
