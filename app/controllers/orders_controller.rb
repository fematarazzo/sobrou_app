class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]
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
  end

  def create
    @order = Order.new
    @dish = Dish.find(params[:dish_id])
    @restaurant = @dish.restaurant
    @order.dish = @dish
    @order.user = current_user
    authorize @order
    if @order.user.owner == current_user
      redirect_to restaurant_orders_path(@restaurant)
    else
      if @order.save
        @dish.quantity = @dish.quantity - 1
        @dish.save
        sweetalert_success('Confira agora os detalhes do seu pedido', 'Reserva agendada!', persistent: 'Vamos nessa!')
        redirect_to order_path(@order), notice: "Reserva agendada!"
      else
        render "dishes/show"
      end
    end
  end

  def edit
  end

  def update
    @order.update(order_params)
    sweetalert_info('Não se esqueça de avaliar seu prato! Acesse Meu Perfil e avalie', 'Tudo Pronto! Que tal avaliar o prato depois?', persistent: 'Vamos nessa!')
    redirect_to root_path, notice: "Não se esqueça de avaliar seu prato! Acesse Meu Perfil e avalie"
  end

  def destroy
    @order.destroy
  end

  private

  def set_order
    @order = Order.find(params[:id])
    @order = Order.includes(:dish).find(params[:id])
    authorize @order
  end

  def order_params
    params.require(:order).permit(:rating, :description_rating)
  end
end
