class Song < ActiveRecord::Base
   belongs_to :user

   has_and_belongs_to_many :mixtapes
   has_many :song_facts

   validates :title, uniqueness: { scope: :artist,
    message: "That song is already in the Mix.r Library" }

   # validates :src_url,

end
