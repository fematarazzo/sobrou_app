class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def index_today?
    true
  end
  def show?
    # Pro usuario que criou ela ou pro restaurante que e dono dessa ordem
    owner?
  end

  def create?
    # Somente um usuario
    owner?
  end

  def edit?
    # somente o restaurante
    owner?
  end

  def update?
    # soemtne o restraurtnte
    owner?
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
