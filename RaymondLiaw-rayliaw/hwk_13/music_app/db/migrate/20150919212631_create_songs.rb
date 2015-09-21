class CreateSongs < ActiveRecord::Migration
  def change
    drop_table :songs
    create_table :songs do |t|
      t.string :name
      t.string :genre
      t.integer :year
      t.string :length
      t.references :artist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
