class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, force: true do |t|
     t.string   :dj_name
     t.string   :avatar

     t.string   :email
     t.string   :password_digest

     t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :avatar, unique: true
    add_index :users, :dj_name, unique: true
  end
end
