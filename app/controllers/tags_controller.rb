class TagsController < ApplicationController
    def index
        @tags = current_user.tags
    end
    
    def new
        @tag = Tag.new
    end

    def create
        @tag = current_user.tags.create(tag_params)
        if @tag.valid?
            redirect_to user_tags_path(current_user)
        else
            redirect_to :back
        end
    end

    def show
    end
 
    def add
        @image = Image.find(params[:image_id])
        @tag = Tag.find(params[:id])

        @image.tags.push(@tag)

        redirect_to user_tags_path(current_user)        
    end

    def remove
        @image = Image.find(params[:image_id])
        @tag = Tag.find(params[:id])

        @image.tags.destroy(@tag)
        redirect_to user_tags_path(current_user)
    end

    private

    def tag_params
        params.require(:tag).permit(:name)
    end
end
