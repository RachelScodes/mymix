class Song < ActiveRecord::Base
   belongs_to :user

   has_and_belongs_to_many :mixtapes
   has_many :song_facts

   validates :title, :artist, presence: true

   validates :title, uniqueness: { scope: :artist,
      case_sensitive: false,
      message: "matches a song that is already in the Mix.r Library. \n Add it from the drop-down instead!" }

   # validates :src_url,

end
