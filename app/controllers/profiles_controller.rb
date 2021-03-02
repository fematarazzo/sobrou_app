class ProfilesController < ApplicationController
  def show
    @orders = Order.where(user: current_user)
  end
end
