class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @dish = Dish.find(params[:id])
    @order.dish = @dish
    @order.user = current_user
    if @order.save
      redirect_to order_path(@order)
    else
      render "dishes/show"
    end
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit(:rating, :description_rating)
  end
end
