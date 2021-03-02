class DishesController < ApplicationController
  before_action :set_dish, only: %i[show edit update destroy]
  def index
    @dishes = Dish.all unless params[:search].nil? && params[:category].nil? && params[:search].blank?
    @dishes = Dish.where("address ILIKE ?", "%#{params[:search]}%") if params[:search]
    @dishes = Dish.where(category: params[:category]) if params[:category]
  end

  def show
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    @restaurant = Restaurant.find(params[:id])
    @dish.restaurant = @restaurant
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

  def set_trailer
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:price, :description)
  end
end
