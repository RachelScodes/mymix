class CreateMixtape < ActiveRecord::Migration
  def change
    create_table :mixtapes do |t|
      t.string :name
      t.string :dedication
      t.string :about

      t.timestamps null: false
    end
  end
end
