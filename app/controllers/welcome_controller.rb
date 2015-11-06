class WelcomeController < ApplicationController

   def index
      @mixtapes = Mixtape.all.order(created_at: :desc)
      @songs = Song.all.order(created_at: :desc)
      # @all.order(created_at: :desc)
   end

end
