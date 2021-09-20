class TagPolicy < ApplicationPolicy
    def index?
        user.present?
    end

    def create?
        @user.present?
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