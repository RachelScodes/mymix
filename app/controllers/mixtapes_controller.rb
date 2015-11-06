class MixtapesController < ApplicationController

   # before_filter authorize :except => [:index, :show]


   def index
      @mixtapes = Mixtape.all
   end

   def show
      @mixtape = Mixtape.find(params[:id])
      @song = Song.new
      @song.mixtape_id = @mixtape.id
   end
   def new
      @mixtape = Mixtape.new
   end

   def create
      @mixtape = Mixtape.new(mixtape_params)
      @mixtape.save

      # flash.notice = "Mixtape '#{@mixtape.title}' Created!"

      redirect_to mixtape_path(@mixtape)
   end

   def edit
      @mixtape = Mixtape.find(params[:id])
   end

   def update
      @mixtape = Mixtape.find(params[:id])
      @mixtape.update(mixtape_params)

      # flash.notice = "Mixtape '#{@mixtape.title}' Updated!"

      redirect_to mixtape_path(@mixtape)
   end

   def destroy
      @mixtape = Mixtape.find(params[:id])

      # flash.notice = "Mixtape '#{@mixtape.title}' Deleted!"

      @mixtape.destroy

      redirect_to mixtapes_path
   end

end
