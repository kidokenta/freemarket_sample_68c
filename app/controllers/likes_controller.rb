class LikesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @like = current_user.likes.build(item_id: params[:item_id])
    @like.save 
  end

  def destroy
    @item = Item.find(params[:item_id])
    @like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
    @like.destroy
  end

  def show
    @item = Item.all
    @user = User.find_by(params[:id])
    @items = @user.items
    @like_items = @user.likes.map{|like| like.item}
    # @like_items = @user.like_items
  end
end
