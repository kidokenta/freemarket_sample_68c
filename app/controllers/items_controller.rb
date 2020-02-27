class ItemsController < ApplicationController

  before_action :redirect_root, except: [:index, :show]
  before_action :set_item, only: [:buy, :show,:comfirm,:transaction,:edit,:update]

  before_action :set_image, only: [:show,:comfirm,:transaction]
  before_action :set_card, only: [:comfirm,:buy]
  before_action :set_adress, only: [:comfirm,:buy]
  


  
  def index
    @new_items = Item.where(status: 0).order(created_at: "desc").limit(3)
    @images = Image.all
  end
  
  def new
    @item = Item.new
    10.times{@item.images.build}
    @item_condition = [["新品、未使用","0"],["未使用に近い","1"],["目立った傷や汚れなし","2"],["やや傷や汚れあり","3"],["傷や汚れあり","4"],["全体的に状態が悪い","5"],["ゴミ","6"]]
    @item_shipping_fee = ["選択してください","送料込み(出品者負担)","着払い(購入者負担)"]
    @results = Country.where('prefecture_id IN(?)', params[:prefecture_id])
    @item_shipping_days = ["選択してください","1~2日で発送","2~3日で発送","4~7日で発送"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil).pluck(:name,:id)
    @size_parent_array = Size.where(ancestry: nil).pluck(:size,:id)
  end

  def edit
    10.times{@item.images.build}
    @item_condition = [["新品、未使用","0"],["未使用に近い","1"],["目立った傷や汚れなし","2"],["やや傷や汚れあり","3"],["傷や汚れあり","4"],["全体的に状態が悪い","5"],["ゴミ","6"]]
    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil).pluck(:name,:id)
    @size_parent_array = Size.where(ancestry: nil).pluck(:size,:id)
    @item_status = [0,1,2,3,4]
    @item_shipping_fee = ["選択してください","送料込み(出品者負担)","着払い(購入者負担)"]
    @item_shipping_region = ["選択してください","北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"]
    @item_shipping_days = ["選択してください","1~2日で発送","2~3日で発送","4~7日で発送"]
    @images = Image.where(item_id: @item.id)
    @size = Size.find_by(id: @item.size_id)
    @size_parent = Size.find_by(id: @item.size_id).parent
    @size_children_array = Size.find_by(id: @size_parent.id).children.pluck(:size,:id)
    @selected_category = Category.find_by(id: @item.category)
    @selected_category_children = Category.find_by(id: @item.category).parent
    @category_grandchildren_array = Category.find_by(id: @selected_category_children).children.pluck(:name,:id)
    @selected_category_parent = Category.find_by(id: @item.category).root 
    @category_children_array = Category.find_by(id: @selected_category_parent).children.pluck(:name,:id)
 
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

  def get_category_children_edit
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren_edit
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_size_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @size_children = Size.find_by(size: "#{params[:parent_size]}", ancestry: nil).children
  end

  def get_size_children_edit
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @size_children = Size.find_by(size: "#{params[:parent_size]}", ancestry: nil).children
  end

  def get_size
    selected_grandchild = Category.find("#{params[:grandchild_id]}") #孫カテゴリーを取得
    if related_size_parent = selected_grandchild.products_sizes[0] #孫カテゴリーと紐付くサイズ（親）があれば取得
       @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得
    else
       selected_child = Category.find("#{params[:grandchild_id]}").parent #孫カテゴリーの親を取得
       if related_size_parent = selected_child.products_sizes[0] #孫カテゴリーの親と紐付くサイズ（親）があれば取得
          @sizes = related_size_parent.children #紐づいたサイズ（親）の子供の配列を取得
       end
    end
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      flash[:notice] = "出品に失敗しました"
      redirect_to new_item_path
    end
  end


  def update
    binding.pry
    if @item.update
      redirect_to item_path(@item.id), notice: '変更内容を保存しました。'
    else
      #updateを失敗すると編集ページへ
      redirect_to edit_item_path
    end
  end

  def show
    @seller_user = User.find_by(id: @item.seller_user_id)
    @images = Image.where(item_id: @item.id)
    @results = Country.where('prefecture_id IN(?)', params[:prefecture_name])
    @size = Size.find_by(id: @item.size_id)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to user_path(current_user.id)
  end
  
  def comfirm
    if @card
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def buy
    @item.status = 3
    @item.buyer_user_id = current_user.id
    @item.save!(validate: false)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id, #顧客ID
      card: params['payjp-token'],
      currency: 'jpy'
    )
    redirect_to action: "transaction"
  end
  
  def transaction
    @size = Size.find_by(id: @item.size_id)
  end


  def search
    respond_to do |format|
      format.html
      format.json do
       @children = Category.find(params[:parent_id]).children
       #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
    @items = Item.search(params[:keyword])
  end


  private
  def item_params
    params.require(:item).permit(:name,:explain,:brand,:status,:condition,:shipping_fee,:shipping_days,:shipping_region,:price,:size,:category_id,images_attributes:[:image]).merge(seller_user_id: current_user.id).merge(size_id: params[:size]).merge(category_id: params[:category_id])
  end

  def edit_params
    params.require(:item).permit(:name,:explain,:brand_id,:status,:condition,:shipping_fee,:shipping_days,:shipping_region,:price,:size,:category_id,images_attributes:[:image, :id]).merge(seller_user_id: current_user.id)
  end

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_image
    @first_image = Image.find_by(item_id: @item.id)
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_adress
    @adress = Adress.find_by(user_id: current_user.id)
  end

end
