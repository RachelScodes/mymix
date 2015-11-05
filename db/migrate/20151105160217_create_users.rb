class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, force: true do |t|
     t.string   :dj_name
     t.string   :email
     t.string   :password_digest

     t.string   :avatar

     t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
