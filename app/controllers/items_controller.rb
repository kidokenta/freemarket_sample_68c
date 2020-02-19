class ItemsController < ApplicationController

  before_action :redirect_root, except: :index

  def index
    @new_items = Item.all.order(created_at: "desc").limit(3)
    @images = Image.all
  end
  
  def new
    @item = Item.new
    @category_parent_array = ["---"]
       #データベースから、親カテゴリーのみ抽出し、配列化
          Category.where(ancestry: nil).each do |parent|
             @category_parent_array << parent.name
          end
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
 end

 # 子カテゴリーが選択された後に動くアクション
 def get_category_grandchildren
   #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
 end

  def create
    @item = Item.create(item_params)
  end

  def show
    @item = Item.find(params[:id])
    @seller_user = User.find_by(id: @item.seller_user_id)
    @images = Image.where(item_id: @item.id)
    @first_image = Image.find_by(item_id: @item.id)
    # 各条件はhelperに記載
  end

  def search
    respond_to do |format|
      format.html
      format.json do
       @children = Category.find(params[:parent_id]).children
       #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
  end

  private
  def item_params
    params.require(:item).permit(:name,:explain,:category_id,:brand_id,:status,:condition,:shipping_fee,:shipping_days,:shipping_company,:shipping_region,:price,:size).merge(seller_user_id: current_user.id)
  end

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end

end
