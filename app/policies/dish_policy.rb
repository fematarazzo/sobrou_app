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
      if record.restaurant_id == @restaurant.id
        true
      else
        false
      end
    end

    def create?
      # @restaurant.id
      # record ==> @dish
      if record.restaurant_id == @restaurant.id
        true
      else
        false
      end
    end

    def edit?
      # @restaurant.id
      # record ==> @dish
      if record.restaurant_id == @restaurant.id
        true
      else
        false
      end
    end
  end
end
