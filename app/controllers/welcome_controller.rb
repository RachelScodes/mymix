class WelcomeController < ApplicationController

   def index
      @mixtapes = Mixtape.all.order(created_at: :desc).limit(5)
      @songs = Song.all.order(created_at: :desc).limit(5)
   end

end
