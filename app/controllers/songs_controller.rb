class SongsController < ApplicationController

   # before_filter authorize: :except => [:index, :show]

   def new
      @song = Song.new
   end

   def create
      @song = Song.new(song_params)
      @song.save

      # depending on where the song is created, different actions
      # song made on a mixtape:
      if URI(request.referer).path == '/users/:user_id/mixtapes/:mixtape_id'
         # join song to mixtape it came from
         @rec = @song.recordings.new
         @rec.mixtape_id = params[:mixtape_id]
         @rec.save

         binding.pry
         redirect_to mixtape_path(@rec.mixtape_id)

      # song made on its own, not in reference to a mixtape
      else
         redirect_to song_path(@song)
      end
   end

   def show
      @song = Song.find(params[:id])
   end

   private

   def song_params
     params.require(:song).permit(:title, :artist, :album, :date_released, :src_url, :user_id)
   end

end
