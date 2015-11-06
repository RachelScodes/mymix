class WelcomeController < ApplicationController

   def index
      @mixtapes = Mixtape.all.order(created_at: :desc)
      @songs = Song.all.order(created_at: :desc)

      # @all_sorted = (@mixtapes + @songs).sort{|mixtape,song| mixtape.created_at <=> song.created_at }
   end

end
