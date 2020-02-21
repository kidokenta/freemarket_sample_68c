class ItemsController < ApplicationController

  before_action :redirect_root, except: [:index, :show]
  before_action :set_item, only: [:buy, :show,:comfirm,:transaction]
  before_action :set_image, only: [:show,:comfirm,:transaction]
  before_action :set_card, only: [:comfirm,:buy]
  before_action :set_adress, only: [:comfirm,:buy]


  
  def index
    @new_items = Item.where(status: 0).order(created_at: "desc").limit(3)
    @images = Image.all
  end
  
  def new
    @item = Item.new
    10.times{ @item.images.build}
    # @item_status = ["選択してください","新品"、"未使用","未使用に近い","目立った傷や汚れなし","やや傷や汚れあり","傷や汚れあり","全体的に状態が悪い"]
    @item_status = [0,1,2,3,4]
    @item_shipping_fee = ["選択してください","送料込み(出品者負担)","着払い(購入者負担)"]
    @item_shipping_region = ["選択してください","北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県","茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県","新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県","静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県","奈良県","和歌山県","鳥取県","島根県","岡山県","広島県","山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県","長崎県","熊本県","大分県","宮崎県","鹿児島県","沖縄県"]
    @item_shipping_days = ["選択してください","1~2日で発送","2~3日で発送","4~7日で発送"]
    @category_parent_array = ["---","898/970"]
       #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
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
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      flash[:nitice] = "出品に失敗しました"
    end
  end

  def show
    @seller_user = User.find_by(id: @item.seller_user_id)
    @images = Image.where(item_id: @item.id)
    # 各条件はhelperに記載
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
    params.require(:item).permit(:name,:explain,:category_id,:brand_id,:status,:condition,:shipping_fee,:shipping_days,:shipping_company,:shipping_region,:price,:size,images_attributes:[:image]).merge(seller_user_id: current_user.id)
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