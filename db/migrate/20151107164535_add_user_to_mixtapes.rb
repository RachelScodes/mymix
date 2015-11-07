class AddUserToMixtapes < ActiveRecord::Migration
  def change
     add_reference :mixtapes, :user, index: true, foreign_key: true
  end
end
