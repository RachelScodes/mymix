class Song < ActiveRecord::Base
   belongs_to :user

   has_and_belongs_to_many :mixtapes

   validates :title, uniqueness: { scope: :artist,
    message: "That song is already in the Mix.r Library" }

end
