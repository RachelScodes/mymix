class MixtapesController < ApplicationController

   before_filter :authorize, except: [:index, :show]

   def index
      @mixtapes = Mixtape.all
   end

   def show
      @mixtape = Mixtape.find(params[:id])
      @song = Song.new
   end

   def new
      @mixtape = Mixtape.new
   end

   def create
      @mixtape = Mixtape.new(mixtape_params)
      @mixtape.user_id = current_user.id

      if @mixtape.save
         flash.notice = "#{@mixtape.title}!? Nice! Let's add some songs!"
         redirect_to mixtape_path(@mixtape)
      else
         render 'new'
      end
   end

   def edit
      @mixtape = Mixtape.find(params[:id])
   end

   def update
      @mixtape = Mixtape.find(params[:id])

      if @mixtape.update(mixtape_params)
         flash.notice = "'#{@mixtape.title}' Updated!"
         redirect_to mixtape_path(@mixtape)
      else
         flash.errors
         render 'show'
      end
   end

   def destroy
      @mixtape = Mixtape.find(params[:id])

      if @mixtape.destroy
         flash.notice = "'#{@mixtape.title}' Deleted!"
         redirect_to mixtapes_path
      else
         flash.errors
         render 'show'
      end
   end

   def record_song
		song = Song.find(params[:mixtapes_songs][:song_id])

      # access mixtape correctly depending on referrer:
      if ( URI(request.referer).path.match '/songs/' )
         mixtape = Mixtape.find(params[:mixtapes_songs][:mixtape_id])
      else
		   mixtape = Mixtape.find(params[:id])
      end

		mixtape.record(song)
		redirect_to mixtape_path(mixtape)
	end

	def erase_song
		mixtape = Mixtape.find(params[:id])
		song = Song.find(params[:song_id])
		mixtape.erase(song)
		redirect_to mixtape_path(mixtape)
	end

   private

   def mixtape_params
      params.require(:mixtape).permit(
      :name,
      :dedication,
      :about,
      :img_src,
      :user_id,
      :mixtape_songs,
      :song_id,
      :song
      )
   end

end
