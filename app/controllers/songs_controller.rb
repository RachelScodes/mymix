class SongsController < ApplicationController

   before_filter :authorize, except: [:index, :show]

   def index
      @songs = Song.order(created_at: :desc)
   end

   def new
      @song = Song.new
   end

   def create
      # depending on where the song is created
      # different stuff happens

      # coming from mixtape, sanitize all the things!
      if params[:song][:mixtape_id]
         mixtape = Mixtape.find(params[:song][:mixtape_id])
         params[:song].delete(:mixtape_id)
      end

      @song = Song.new(song_params)
      @song.user_id = current_user.id

      # coming from a mixtape:
		if ( URI(request.referer).path.match '/mixtapes/' ) && @song.save
			# join song to mixtape it came from
			mixtape.record(@song)
			# flash[] = "You added #{song.title} by #{song.artist} to #{mixtape.name}! Rock on!"
			redirect_to mixtape_path(mixtape)
      # coming from mixtape, with errors:
		elsif URI(request.referer).path.match '/mixtapes/'
         binding.pry
			render 'mixtapes/show'
      # song made as standalone
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
     :user_id,
     :mixtapes_songs,
     :mixtape_id,
     )
   end

end
