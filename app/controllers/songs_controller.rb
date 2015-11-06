class SongsController < ApplicationController

   # before_filter :authorize :except => [:index, :show]

   def create
     @song = Song.new(song_params)
     @song.mixtape_id = params[:mixtape_id]

     @song.save

     redirect_to mixtape_path(@song.mixtape)
   end

   def song_params
     params.require(:song).permit(:author_name, :body)
   end


end
