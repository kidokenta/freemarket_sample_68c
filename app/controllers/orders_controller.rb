class OrdersController < ApplicationController
  def new
    @card = Card.find_by(user_id: current_user.id)
    @card = Card.new
    # @item = Item.find(id: params[:id])
  end


  def create
    @order = Order.create
    @item.status = 3
    @item.save
      flash[:success] = "購入しました。"
    redirect_to ("/") and return
  end

  private

  # def order_params
  #   params.require(:order).mage(:item_id params[:id],:buyer_user_id current_user.id) 
  # end

end

