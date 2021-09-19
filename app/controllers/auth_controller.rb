class AuthController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user.authenticate(params[:password])
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
