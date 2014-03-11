class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :content_provider  # N : Naver Music
                                  # D : Daum Music
                                  # M : Melon
                                  # Y : Youtube 

      t.string :title
      t.string :artist

      t.string :youtube_hash # Hash for Youtube.com watch / embed / thumbnail

      t.timestamps
    end
  end
end
