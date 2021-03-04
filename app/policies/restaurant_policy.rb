class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def show?
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

  def dashboard?
    owner?
  end

  private

  def owner?
    # user ==> current_user
    # record ==> @restaurant
    record.user == user
  end
end
