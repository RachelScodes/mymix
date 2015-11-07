class SongsController < ApplicationController

   before_filter :authorize, except: [:index, :show]

   def index
      @songs = Song.order(created_at: :desc)
   end

   def new
      @song = Song.new
   end

   def create
      @song = Song.new(song_params)
      @song.user_id = current_user.id
      mixtape = Mixtape.find(params[:mixtape_id])

      # depending on where the song is created, different actions
      # song made on a mixtape:
		if @song.save && ( URI(request.referer).path.match '/mixtapes/' )
			# join song to mixtape it came from
			params[:mixtapes_songs][:id]
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

      redirect_to song_path(@song)
   end

   def show
      @song = Song.find(params[:id])
   end

   def destroy
      @song = Song.find(params[:id])

      # if song is used on mixtapes, remove:
      if @song.mixtapes.length > 0
         @song.mixtapes.each { |m| m.erase_song(@song) }
      end

      @song.destroy

      # can only destroy song from song detail view
      # therefore redirect based on how you got to view
      # if viewed detail from mixtape, go back to that tape
      # if viewed from user page, go back to that page
      redirect_to @back_url
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
