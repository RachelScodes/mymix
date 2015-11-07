class SongsController < ApplicationController

   before_filter :require_login, except: [:index, :show]

   def index
      @songs = Song.order(created_at: :desc)
   end

   def new
      @song = Song.new
   end

   def create
      @song = Song.new(song_params)
      @song.user_id = current_user.id

      # depending on where the song is created, different actions
      # song made on a mixtape:
		if @song.save && ( URI(request.referer).path.match '/mixtapes/' )
         # join song to mixtape it came from
         mixtape = Mixtape.find(params[:mixtape_id])
         mixtape.record_song(@song)
			flash[] = "You added #{song.title} by #{song.artist} to #{mixtape.name}! Rock on!"
			redirect_to mixtape_path(mixtape)
		elsif URI(request.referer).path.match '/mixtapes/'
         render mixtape_path(mixtape)
      elsif @song.save
			redirect_to song_path(@song)
      else
         render 'new'
		end
	end

   def edit
      @song = Song.find(params[:id])
   end

   def update
      @song = Song.find(params[:id])
      @song.update(song_params)
   end

   def show
      @song = Song.find(params[:id])
   end

   def destroy
      @song = Song.find(params[:id])
      # if coming from mixtape, just remove from mixtape
      binding.pry
      if URI(request.referer).path.match '/mixtapes/'
         mixtape.erase_song(@song)
         redirect_to mixtape_path(mixtape)
      else
         mixtapes = Mixtape.where(:song_id == @song.id)
         mixtape.each { |m| m.erase_song(@song)}
         @song.destroy
         redirect_to '/index'
      end
   end

   private

   def song_params
     params.require(:song).permit(
     :title,
     :artist,
     :album,
     :date_released,
     :src_url,
     :user_id
     )
   end

end
