class TagsController < ApplicationController
  before_action :unauthorized_redirect

  def index
    @user = current_user
    @tags = @user.tags
  end

  def create
    @user = current_user
    @tag = @user.tags.create(tag_params)
    if @tag.valid?
      redirect_to user_tags_path(@user)
    else
      redirect_to user_tags_path(@user)
    end
  end

  def show
    @user = current_user
    @tag = Tag.find(params[:id])
    @images = @tag.images
  end

  def destroy
    @user = current_user
    Tag.find(params[:id]).destroy
    redirect_to user_tags_path(@user)
  end

  def add
    @image = Image.find(params[:image_id])
    @tag = Tag.find(params[:id])

    @image.tags.push(@tag)

    redirect_to user_image_path(current_user, @image)
  end

  def remove
    @image = Image.find(params[:image_id])
    @tag = Tag.find(params[:id])
    authorize @tag, :add?

    @image.tags.destroy(@tag)
    redirect_to user_image_path(current_user, @image)
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
