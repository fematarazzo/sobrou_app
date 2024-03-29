class DishesController < ApplicationController
  before_action :set_dish, only: %i[show edit update destroy]
  # For authorizing users to navigate through some pages
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only: [:index_owner]

  def index
    skip_policy_scope
    # Checking the search bar params
    if params[:search][:address].blank? && params[:search][:category] == [""]
      @restaurants = policy_scope(Restaurant)
    elsif !params[:search][:address].blank? && params[:search][:category] == [""]
      @restaurants = Restaurant.near(params[:search][:address], 5)
    elsif params[:search][:address].blank? && params[:search][:category].size > 1
      @restaurants = Restaurant.where(category: params[:search][:category] - [""])
    elsif !params[:search][:address].blank? && params[:search][:category].nil?
      @restaurants = Restaurant.near(params[:search][:address], 5)
    else
      @restaurants = Restaurant.near(params[:search][:address], 5).where(category: params[:search][:category] - [""])
    end
    # For displaying which dishes
    @dishes = []
    @restaurants.each do |restaurant|
      restaurant.dishes.each { |dish| @dishes << dish }
    end
    @order = Order.new
  end

  def index_owner
    # Only for restaurant owner
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dishes = policy_scope(Dish).select { |dish| @restaurant == dish.restaurant }
  end

  def create
    @dish = Dish.new(dish_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish.restaurant = @restaurant
    authorize @dish
    if @dish.save
      redirect_to restaurant_index_owner_path(@restaurant)
    else
      redirect_to restaurant_dashboard_path(@restaurant)
    end
  end

  def edit
    @restaurant = @dish.restaurant
  end

  def update
    @dish.update(dish_params)
    if current_user.owner?
      redirect_to restaurant_index_owner_path(@dish.restaurant)
    else
      redirect_to profile_path(current_user)
    end
  end

  def destroy
    @dish.destroy
    redirect_to restaurant_index_owner_path(@dish.restaurant)
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
    @dish = Dish.includes(:restaurant).find(params[:id])
    authorize @dish
  end

  def dish_params
    params.require(:dish).permit(:name, :price, :description, :quantity, :photo, :start_time, :end_time, :date, :rating)
  end
end
