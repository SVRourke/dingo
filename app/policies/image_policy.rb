class ImagePolicy < ApplicationPolicy
  def index?
    @user.images == @images
  end

  def new?
    @user.present?
  end

  def create?
    @user.id == @record.id
  end

  def show?
    @user.present? && @record.user == @user
  end

  def destroy?
    @user.present? && @record.user == @user
  end
end
