class AuthController < ApplicationController
    def def new
    end
    
    def create
        @user = User.find_by(username: params[:username])
        
        if @user.authenticate(params[:password])
          flash[:success] = "logged in"
          session[:user_id] = @user.id
          redirect_to image_index_path
        else
          flash[:error] = "Something went wrong"
          redirect_to login_path
        end
    end
    
    def destroy
        if logged_in?
            session.clear()
        end
    end

end