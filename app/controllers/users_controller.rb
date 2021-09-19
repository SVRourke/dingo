class UsersController < ApplicationController

    def new
        @user = User.new
    end
    

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_image_index_path(@user)
        else
            flash[:error] = @user.error_messages
            redirect_back
        end
    end

    # update
    # delete
    def destroy
        current_user.destroy
        redirect_to :root
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end