class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def dashboard?
      owner?
    end

    def index?
      true
    end

    def show?
      true
    end

    def new?
      true
    end

    def create?
      true
    end

    def edit?
      owner?
    end

    def update?
      owner?
    end

    def destroy?
      owner?
    end

    private

    def owner?
      # user ==> current_user
      # record ==> @restaurant
      record.user == user
    end
  end
end
