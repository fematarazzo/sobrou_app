class OrdersController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @orders = Order.all.select { |order| @restaurant == order.dish.restaurant }
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new
    @dish = Dish.find(params[:id])
    @order.dish = @dish
    @order.user = current_user
    if @order.save
      redirect_to order_path(@order)
    else
      render "dishes/show"
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @dish.update(dish_params)
    redirect_to dish_path(@dish)
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit(:rating, :description_rating)
  end
end
