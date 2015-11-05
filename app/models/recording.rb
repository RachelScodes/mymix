class Recording < ActiveRecord::Base

   belongs_to :mixtape
   belongs_to :song

end
