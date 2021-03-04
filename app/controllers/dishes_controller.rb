class DishesController < ApplicationController
  before_action :set_dish, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    skip_policy_scope
    @change_nav = true

    if params[:search][:address].blank? && params[:search][:category] == [""]
      @restaurants = policy_scope(Restaurant)
    elsif !params[:search][:address].blank? && params[:search][:category] == [""]
      @restaurants = Restaurant.near(params[:search][:address], 5)
    elsif params[:search][:address].blank? && params[:search][:category].size > 1
      @restaurants = @restaurants.where(category: params[:search][:category] - [""])
    else
      @restaurants = Restaurant.near(params[:search][:address], 5).where(category: params[:search][:category] - [""])
    end
    @dishes = []
    @restaurants.each do |restaurant|
      restaurant.dishes.each { |dish| @dishes << dish }
    end
  end

  def show
    @order = Order.new
  end

  def new
    @dish = Dish.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    authorize @dish
  end

  def create
    @dish = Dish.new(dish_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish.restaurant = @restaurant
    authorize @dish
    if @dish.save
      redirect_to dish_path(@dish)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @dish.update(dish_params)
    redirect_to dish_path(@dish)
  end

  def destroy
    @dish.destroy
    redirect_to dishs_path
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
    @dish = Dish.includes(:restaurant).find(params[:id])
    authorize @dish
  end

  def dish_params
    params.require(:dish).permit(:name, :price, :description, :photo)
  end
end
