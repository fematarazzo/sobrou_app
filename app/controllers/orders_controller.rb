class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def create
    @order = Order.new
    @dish = Dish.find(params[:id])
    @order.dish = @dish
    @order.user = current_user
    authorize @order
    if @order.save
      redirect_to order_path(@order)
    else
      render "dishes/show"
    end
  end

  def edit
    @order = Order.find(params[:id])
    authorize @order
  end

  def update
    @dish.update(dish_params)
    redirect_to dish_path(@dish)
    authorize @order
  end

  def destroy
    authorize @order
  end

  private

  def order_params
    params.require(:order).permit(:rating, :description_rating)
  end
end
