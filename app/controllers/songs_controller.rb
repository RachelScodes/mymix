class SongsController < ApplicationController

   before_filter :authorize, except: [:index, :show]

   def index
      @songs = Song.order(created_at: :desc)
   end

   def new
      @song = Song.new
   end

   def create
      binding.pry
      # Different actions depending where song was created
      # Coming from mixtape, sanitize params!
      if params[:song][:mixtape_id]
         if params[:song][:mixtape_id] != "42"
            @mixtape = Mixtape.find(params[:song][:mixtape_id])
         end
         params[:song].delete(:mixtape_id)
      end

      @song = Song.new(song_params)
      @song.fix_url(params[:song][:audio])
      @song.user_id = current_user.id

      # Verify redirects and actions based on URL referrer
      add_from_mix(URI(request.referer).path,@mixtape,@song)
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
      path = params[:path] # get path for redirect
      params.delete(:path) # sanitize params

      @song = Song.find(params[:id])

      # if song is used on mixtapes, remove:
      if @song.mixtapes.length > 0
         @song.mixtapes.each { |m| m.erase(@song) }
      end

      @song.destroy

      # can only destroy song from song detail view
      # redirect based on how you got to view
      redirect_to path
   end

   private

   def add_from_mix(path,mixtape,song)
      # Coming from a mixtape:
      if ( path.match '/mixtapes/' ) && song.save
         binding.pry
         mixtape.record(song) # record song to mixtape it came from
         # flash[] = "You added #{song.title} by #{song.artist} to #{mixtape.name}! Rock on!"
         redirect_to path #success
      elsif path.match '/mixtapes/'
         redirect_to path, flash: {errors: song.errors}
      # song made as standalone
      elsif song.save
         redirect_to song_path(song) # success
      else
         render 'new' # song made as standalone, unsuccessful
      end
   end

   def song_params
     params.require(:song).permit(
     :title,
     :artist,
     :album,
     :date_released,
     :audio,
     :user_id,
     :mixtapes_songs,
     :mixtape_id,
     )
   end

end
