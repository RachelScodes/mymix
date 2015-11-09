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
      self.songs << song
      ending = self.songs.length

      if ending == starting
         self.add_error("That song is already on your Mixtape! Choose another from the list!")
      end
   end

   def erase(song)
      self.songs.destroy(song)
   end

   # validate urls. look at work on blogger
   # def tag_list=(tags_string)
   #    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
   #    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
   #    self.tags = new_or_found_tags
   # end
   #
   # def tag_list
   #   tags.join(", ")
   # end


end
