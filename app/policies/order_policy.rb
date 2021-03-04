class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    # Pro usuario que criou ela ou pro restaurante que e dono dessa ordem
    owner?
  end

  def new?
    # Somente um usuario
    user
  end

  def create?
    # Somente um usuario
    user
  end

  def edit?
    # somente o restaurante
    record.dish.restaurant.user == user
  end

  def update?
    # soemtne o restraurtnte
    record.dish.restaurant.user == user
  end

  def destroy?
    # Pro usuario que criou ela ou pro restaurante que e dono dessa ordem
    owner?
  end

  private

  def owner?
    # user ==> current_user
    # record ==> @restaurant
    record.user == user || record.dish.restaurant.user == user
  end
end
