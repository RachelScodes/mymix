class RenameSrcColumnSongs < ActiveRecord::Migration
  def change
     rename_column :songs, :src_url, :audio
  end
end
