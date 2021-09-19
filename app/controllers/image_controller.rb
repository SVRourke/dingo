class ImageController < ApplicationController
    def index
        @user = current_user()
        @images = @user.images
    end

    def new
        @user = current_user
        @image = Image.new
        @tags = @user.tags
    end

    def create
        @image = current_user.images.create(image_params)
        if @image.valid?
            redirect_to user_image_index_path(current_user)
        else
            redirect_to :back
        end
    end

    def show
        @image = Image.find(params[:id])
    end

    private

    def image_params
        params.require(:image).permit(:caption, tag_ids: [])
    end

end
