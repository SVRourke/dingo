class AuthController < ApplicationController
  def new
    @disable_heading = true
  end

  def create
    @disable_heading = true
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      flash[:success] = "logged in"
      session[:user_id] = @user.id
      redirect_to user_image_index_path(@user)
    else
      flash[:error] = "Something went wrong"
      redirect_to login_path
    end
  end

  def destroy
    if logged_in?
      session.clear()
      redirect_to :login
    end
  end
end
