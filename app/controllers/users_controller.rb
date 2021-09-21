class UsersController < ApplicationController
  before_action :authorized_redirect
  before_action :unauthorized_redirect

  skip_before_action :authorized_redirect, only: :destroy
  skip_before_action :unauthorized_redirect, only: [:new, :create]

  def new
    # authorize current_user, :new?
    @disable_heading = true
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_image_index_path(@user)
    else
      flash[:error] = "Invalid credentials"
      redirect_to new_user_path()
    end
  end

  # update

  def destroy
    current_user.destroy!
    session.clear()
    redirect_to root_path()
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
