class DishPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    # @restaurant.id
    # record ==> @dish
    true
  end

  def create?
    # @restaurant.id
    # record ==> @dish
    true
  end

  def edit?
    # @restaurant.id
    # record ==> @dish
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
    record.restaurant.user == user
  end
end
