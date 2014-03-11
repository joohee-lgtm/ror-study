class CreateSongContents < ActiveRecord::Migration
  def change
    create_table :song_contents do |t|
      t.string :origin_url
      t.string :singer
      t.string :album
      t.string :content
      t.string :song

      t.timestamps
    end
  end
end
