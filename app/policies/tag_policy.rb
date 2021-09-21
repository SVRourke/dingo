class TagPolicy < ApplicationPolicy
  def index?
    @user.present? && @user == @record
  end

  def create?
    @user.present? && @user.id == @record
  end

  def show?
    @user.present? && @record.user == @user
  end

  def destroy?
    @user.present? && @record.user == @user
  end

  def add?
    @user.present? && @record.user == @user
  end

  def remove?
    @user.present? && @record.user == @user
  end
end
