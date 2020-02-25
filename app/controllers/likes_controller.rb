class LikesController < ApplicationController
  before_action :set_items
  def create
    @like = current_user.likes.build(item_id: params[:item_id])
    @like.save 
    if !@like.save 
      flash[:notice] = "いいねに失敗しました"
    end
  end

  def destroy
    @like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
    @like.destroy
  end
  def set_items
    @item = Item.find(params[:item_id])
  end
end
