class OrdersController < ApplicationController
  def new
    @card = Card.find_by(user_id: current_user.id)
    @card = Card.new
  end

  def create
    @order = Order.create(order_params)
    @order = Item.update(status: 3)
    @order.save
      flash[:success] = "購入しました。"
    redirect_to ("/") and return
  end

  private

  def order_params
    params.require(:order).mage(:item_id params[:id],:buyer_user_id current_user.id) 
  end

end
