class CreateDaumAlbums < ActiveRecord::Migration
  def change
    create_table :daum_albums do |t|
      t.string :artist
      t.string :title
      t.string :image_name
      t.string :review_writer
      t.text :review

      t.timestamps
    end
  end
end
