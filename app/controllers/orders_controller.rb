class OrdersController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @orders = policy_scope(Order).select { |order| @restaurant == order.dish.restaurant }
  end

  def index_today
    @restaurant = Restaurant.find(params[:restaurant_id])
    @orders = policy_scope(Order).where( "created_at >= ? AND created_at <= ?", Date.today.beginning_of_day, Date.today.end_of_day)
    @orders = @orders.select { |order| @restaurant == order.dish.restaurant }

  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def create
    @order = Order.new
    @dish = Dish.find(params[:dish_id])
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
