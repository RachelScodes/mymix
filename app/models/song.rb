class Song < ActiveRecord::Base
   belongs_to :user

   has_many :recordings
   has_many :mixtapes, through: :recordings
end
