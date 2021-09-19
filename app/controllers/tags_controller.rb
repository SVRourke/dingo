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
    # add-image
    # remove-image
end
