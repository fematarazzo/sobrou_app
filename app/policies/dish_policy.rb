class DishPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def index?
      true
    end

    def show?
      true
    end

    def new?
      # @restaurant.id
      # record ==> @dish
      owner?
    end

    def create?
      # @restaurant.id
      # record ==> @dish
      owner?
    end

    def edit?
      # @restaurant.id
      # record ==> @dish
      owner?
    end

    private

    def owner?
      record.user == user
    end
  end
end
