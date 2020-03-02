class UsersController < ApplicationController
  def show
    @user = current_user
    @items = @user.items
    @like_items = @user.like_items.where(status: 0)
    @buyed_items = Item.where(buyer_user_id: @user.id)
    @selled_items = Item.where(seller_user_id: @user.id)
  end
end
