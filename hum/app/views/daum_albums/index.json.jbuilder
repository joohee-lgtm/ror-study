json.array!(@daum_albums) do |daum_album|
  json.extract! daum_album, :id, :artist, :title, :image_name, :review_writer, :review
  json.url daum_album_url(daum_album, format: :json)
end
