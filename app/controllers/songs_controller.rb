class SongsController < ApplicationController

   # before_filter :authorize :except => [:index, :show]

   def create
     @song = Song.new(song_params)
     @song.save
     @rec = @song.recordings.create
     hit_record

     redirect_to mixtape_path
   end

   def hit_record
      @rec.mixtape_id = params[:id]
   end

   private

   def song_params
     params.require(:song).permit(:title, :artist, :album, :date_released, :src_url, :user_id)
   end

end
