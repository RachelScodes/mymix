class Mixtape < ActiveRecord::Base
   belongs_to :user

   has_many :recordings
   has_many :songs, through: :recordings
end
