class ChatroomsController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @chatroom = Chatroom.find_by(order_code: @order.id)
    @message = Message.new
  end
end
