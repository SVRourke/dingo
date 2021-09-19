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
    @user = current_user
    @tags = Tag.all
    @image = Image.find(params[:id])
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to user_image_index_path(current_user)
  end

  private

  def image_params
    params.require(:image).permit(:caption, tag_ids: [])
  end
end
