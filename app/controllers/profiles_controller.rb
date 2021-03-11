class ProfilesController < ApplicationController
  def show
    @orders = Order.where(user: current_user).reverse
    authorize :profile
  end
end
