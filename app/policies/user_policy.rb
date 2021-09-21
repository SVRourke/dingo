class UserPolicy < ApplicationPolicy
  def create?
    !@user.present?
  end

  def destroy?
    @user.present? && @record == @user
  end
end
