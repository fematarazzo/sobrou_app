class DishesController < ApplicationController
  before_action :set_dish, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    raise
    skip_policy_scope
    @change_nav = true
    # @restaurants = Restaurant.all

    @restaurants = policy_scope(Restaurant)

    @restaurants = @restaurants.near(params[:address], 5) if params[:address].present?
    @restaurants = @restaurants.where(category: params[:category]) if params[:category].present?

    # Sem params address / Sem params category (nenhum checkbox)
    # @restaurants = policy_scope(Restaurant)

    # # Com params address / Sem params category (nenhum checkbox)
    # if params[:address].present? && params[:category].blank?
    #   @restaurants = @restaurants.near(params[:address], 5)

    # Sem params address / Com params category (1 ou mais checkboxes)
    # elsif params[:address].blank? && params[:category].present?
    #   @restaurants = @restaurants.where(category: params[:category])

    # Com params address / Com params category (1 ou mais checkboxes)
    # params[:address].present? && params[:category].present?
    #   @restaurants = @restaurants.near(params[:address], 5).where(category: params[:category])
    # end
    @dishes = []
    @restaurants.each do |restaurant|
      restaurant.dishes.each { |dish| @dishes << dish }
    end
  end

  def show
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
    authorize @dish
  end

  def dish_params
    params.require(:dish).permit(:name, :price, :description, :photo)
  end
end
