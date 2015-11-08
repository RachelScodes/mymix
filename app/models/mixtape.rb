class Mixtape < ActiveRecord::Base
   belongs_to :user

   has_and_belongs_to_many :songs

   validates :name, presence: true, uniqueness: {
      case_sensitive: false,
      message: "is taken buddy. Mix it up!" }


   def add_error(string)
      self.errors.messages.store(:whoops,string)
   end

   def record(song)
      starting = self.songs.length
      self.songs = (self.songs + [song]).uniq
      ending = self.songs.length

      if ending == starting
         self.add_error("That song is already on your Mixtape! Choose another from the list!")
      end
   end

   def erase(song)
      self.songs.destroy(song)
   end
end
