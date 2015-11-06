class WelcomeController < ApplicationController

   def index
      @mixtapes = Mixtape.all.order(created_at: :desc).limit(5)
      @songs = Song.all.order(created_at: :desc).limit(5)

      # @all_sorted = (@mixtapes + @songs).sort{|mixtape,song| mixtape.created_at <=> song.created_at }
   end

end
