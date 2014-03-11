class CreateSongContents < ActiveRecord::Migration
  def change
    create_table :song_contents do |t|
      t.string :origin_url
      t.string :singer
      t.string :album_title
      t.string :song_title
      t.string :content

      t.timestamps
    end
  end
end
