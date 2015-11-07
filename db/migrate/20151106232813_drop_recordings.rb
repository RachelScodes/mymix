class DropRecordings < ActiveRecord::Migration
  def change
    drop_table :recordings
  end
end
