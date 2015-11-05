class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.belongs_to :song, index: true
      t.belongs_to :mixtape, index: true

      t.timestamps null: false
    end
  end
end
