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
    @images = current_user.bulkCreateImages(image_params[:image_file])
    if @images.all? { |i| i.valid? }
      redirect_to user_image_index_path(current_user)
    else
      flash[:error] = "Error"
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

  def bulk
    @user = current_user
    @images = current_user.images
  end

  def bulk_destroy
    @user = current_user
    @images = Image.where(id: params[:user_ids])
    if @images.all? { |i| @user.images.include? i }
      @images.destroy_all
      redirect_to user_image_index_path(current_user)
    else
      flash[:error] = "you can only delete your own images"
      redirect_to :back
    end
  end

  def delete_all
    @user = current_user
    @user.images.each { |i| i.destroy }
    redirect_to user_image_index_path(@user)
  end

  private

  def image_params
    params.require(:image).permit(:title, image_file: [], tag_ids: [])
  end
end
