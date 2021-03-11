module ChatsHelper
  def set_chat(order)
    @chatroom = Chatroom.find_by(order_code: order.id)
  end
end
