class Mixtape < ActiveRecord::Base
   belongs_to :user

   has_and_belongs_to_many :songs

   validates :name, presence: true, uniqueness: true

   def record(song)
      self.songs.push(song)
   end

   def erase(song)
      self.songs.destroy(song)
   end
end
