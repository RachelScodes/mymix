class EditAvatarUniqueness < ActiveRecord::Migration
  def change
     remove_index "users", ["avatar"]
  end
end
