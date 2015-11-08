class SongsController < ApplicationController

   before_filter :authorize, except: [:index, :show]

   def index
      @songs = Song.order(created_at: :desc)
   end

   def new
      @song = Song.new
   end

   def create
      # different actions depending wher song was created
      # coming from mixtape, sanitize params!
      if params[:song][:mixtape_id]
         @mixtape = Mixtape.find(params[:song][:mixtape_id])
         params[:song].delete(:mixtape_id)
      end

      @song = Song.new(song_params)
      @song.user_id = current_user.id

      # verify redirects and actions based on URL referrer
      add_from_mix(@mixtape,@song)
	end

   def add_from_mix(mixtape,song)
      # coming from a mixtape:
      if ( URI(request.referer).path.match '/mixtapes/' ) && song.save
         mixtape.record(song) # record song to mixtape it came from
         # flash[] = "You added #{song.title} by #{song.artist} to #{mixtape.name}! Rock on!"
         redirect_to mixtape_path(mixtape) #success
      elsif URI(request.referer).path.match '/mixtapes/'
         redirect_to :back, flash: {errors: song.errors}
      # song made as standalone
      elsif song.save
         redirect_to song_path(song) # success
      else
         render 'new' # song made as standalone, unsuccessful
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
