class AuthPolicy < ApplicationPolicy
  def new?
    !@user.present?
  end

  def create?
    !@user.present?
  end

  def destroy?
    @user.present? && @record == @user.id
  end
end
