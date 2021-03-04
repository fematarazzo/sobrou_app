class ProfilesController < ApplicationController
  def show
    @orders = Order.where(user: current_user)
    authorize :profile
  end
end
