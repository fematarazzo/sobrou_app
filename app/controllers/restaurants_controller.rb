class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @restaurants = policy_scope(Restaurant).where(user_id: current_user)
  end

  def dashboard
    # Unique method for displaying a dashboard for each restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    authorize @restaurant
    @dish = Dish.new
  end

  def show
    @order = Order.new
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user

    authorize @restaurant

    if @restaurant.save
      redirect_to restaurant_dashboard_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to profile_path(current_user)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone, :photo)
  end
end
