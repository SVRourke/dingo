class UsersController < ApplicationController

    def new
        # authorized_redirect
        @user = User.new
    end
    

    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to image_index_path
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