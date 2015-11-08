class UsersController < ApplicationController

   # before_filter :first_or_authenticated, only: [:index, :new, :create]

   # User must be logged in to add/edit account info
   # Unless they are the first user!

   # def first_or_authenticated
   #   unless User.count == 0 || current_user
   #     redirect_to root_path
   #     return false
   #   end
   # end

   def index
      @users = User.all
   end

   def new
   end

   def create
      @user = User.new(user_params)
      if @user.save
         flash.notice = "Welcome to Mix.r #{@user.dj_name}! You will use this name to login."
         redirect_to "/users/#{@user.id}"
      else
         render 'new'
      end
   end

   def edit
      @user = User.find(params[:id])
   end

   def update
      @user = User.find(params[:id])
      if @user.id != current_user.id
         flash.notice = "I don't know how you got here but EDIT YOUR OWN PROFILE! Jeez. Control freak much?"
         redirect_to user_path(current_user)
      elsif (@user.id == current_user.id) && @user.update(user_params)
         render user_path(@user)
      else
         flash.notice = "Your profile is updated!"
         redirect_to user_path(@user)
      end
   end

   def show
      binding.pry
      @user = User.find(params[:id])
      @mixtapes = @user.mixtapes.order(created_at: :desc)
      @songs = @user.songs.order(created_at: :desc)
   end

   private

   def user_params
    params.require(:user).permit(:dj_name, :email, :avatar, :password, :password_confirmation)
   end


end
