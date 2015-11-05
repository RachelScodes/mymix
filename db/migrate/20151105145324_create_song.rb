class CreateSong < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.date :date_released

      t.string :src_url

      t.references :mixtape, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
