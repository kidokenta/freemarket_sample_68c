class ItemsController < ApplicationController
  def index
    @new_items = Item.all.order(created_at: "desc").limit(3)
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(post_params)
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:post).permit(:images,:itme_name,:item_explain,:category_id,:brand_id,:status,:condition,:shipping_fee,:shipping_days,:shipping_company,:region,:price).merge(seller_user_id: current_user.id)
  end
  
end
