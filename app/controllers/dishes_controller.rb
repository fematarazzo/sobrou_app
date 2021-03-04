class DishesController < ApplicationController
  before_action :set_dish, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    authorize @dish
    @restaurants = Restaurant.all
    @restaurants = @restaurants.near(params[:address], 5) if params[:address].present?
    @restaurants = @restaurants.where(category: params[:category]) if params[:category].present?
    @dishes = []
    @restaurants.each do |restaurant|
      restaurant.dishes.each { |dish| @dishes << dish }
    end
    @dishes
  end

  def show
    authorize @dish
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
    authorize @dish
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
  end

  def dish_params
    params.require(:dish).permit(:name, :price, :description, :photo)
  end
end
