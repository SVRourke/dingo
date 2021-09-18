class ApplicationController < ActionController::Base
    def authorized_redirect
        redirect_to image_index_path if !logged_in?
    end

    def logged_in?
        session[:user_id].present? && current_user.id == session[:user_id]
    end

    def current_user
        @user ||= User.find(session[:user_id])
    end
end
