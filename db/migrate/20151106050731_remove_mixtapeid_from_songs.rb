class RemoveMixtapeidFromSongs < ActiveRecord::Migration
  def change
     remove_column :songs, :mixtape_id
  end
end
