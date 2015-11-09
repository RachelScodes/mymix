class AddIndexMixtapesSongs < ActiveRecord::Migration
  def change
     add_index(:mixtapes_songs, [:mixtape_id, :song_id], :unique => true)
  end
end
