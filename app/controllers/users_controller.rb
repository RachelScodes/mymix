class UsersController < ApplicationController

   def index
      @users = User.all
   end

   def new
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
