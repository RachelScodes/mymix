class UsersController < ApplicationController

   before_filter :first_or_authenticated, only: [:index, :new, :create]

   # User must be logged in to add/edit account info
   # Unless they are the first user!

   def first_or_authenticated
     unless User.count == 0 || current_user
       redirect_to root_path
       return false
     end
   end

   def index
      @users = User.all
   end

   def new
   end

   def edit
   end

   def create
      @user = User.new(user_params)
     if @user.save
       session[:user_id] = @user.id
       redirect_to "/users/#{@user.id}"
     else
       redirect_to '/signup'
     end
   end

   def show
      @user = User.find(params[:id])
   end

   private

   def user_params
    params.require(:user).permit(:dj_name, :email, :avatar, :password, :password_confirmation)
   end


end
