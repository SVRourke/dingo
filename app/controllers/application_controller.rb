class ApplicationController < ActionController::Base
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    
    def unauthorized_redirect
        redirect_to :root if !logged_in?
    end

    def authorized_redirect
        redirect_to user_image_index_path(current_user) if logged_in?
    end

    def logged_in?
        session[:user_id].present? && current_user.id == session[:user_id]
    end

    def current_user
        @user ||= User.find(session[:user_id])
    end

    private

    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to user_image_index_path(current_user)
    end
end
