class ImageController < ApplicationController
  before_action :unauthorized_redirect

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
      flash[:error] = @image.error
      redirect_to :back
    end
  end

  def show
    @user = current_user
    @image = Image.find(params[:id])
    @tags = @user.tags.all
    authorize @image, :show?
  end

  def destroy
    @image = Image.find(params[:id])
    authorize @image, :destroy?
    @image.destroy
    redirect_to user_image_index_path(current_user)
  end

  private

  def image_params
    params.require(:image).permit(:caption, :image_file, tag_ids: [])
  end
end
