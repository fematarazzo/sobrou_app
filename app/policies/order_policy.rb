class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    # Pro usuario que criou ela ou pro restaurante que e dono dessa ordem
    true
  end

  def new?
    # Somente um usuario
    true
  end

  def create?
    # Somente um usuario
    true
  end

  def edit?
    # somente o restaurante
    true
  end

  def update?
    # soemtne o restraurtnte
    true
  end

  def destroy?
    # Pro usuario que criou ela ou pro restaurante que e dono dessa ordem
    true
  end

  private

  def owner?
    # user ==> current_user
    # record ==> @restaurant
    record.user == user || record.dish.restaurant.user == user
  end
end
