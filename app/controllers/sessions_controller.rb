class SessionsController < ApplicationController

   def new
      # login form
   end

   def create
      @user = User.find_by(dj_name: params[:dj_name])

      # If the user exists AND the password entered is correct.
      if @user && @user.authenticate(params[:password])
         # Save the user id inside the browser cookie.
         session[:user_id] = @user.id
         redirect_to '/'
      else
         flash.now[:error] = "Something's not right with that Email/Password combo bro."
         render 'new'
      end
   end

   def destroy
      session[:user_id] = nil
      redirect_to '/'
   end
   # 
   # def store_location
   #    @back_url = URI(request.referer).path
   # end

end
