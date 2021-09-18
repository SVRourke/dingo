class ImagesController < ApplicationController
    def index
        @user = current_user()
        @images = @user.images
    end

end
