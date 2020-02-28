class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

         has_many :sns_credentials

  validates :nickname, presence: true, length: { maximum: 6 }
  validates :family_name        , presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name         , presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana   , presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana    , presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday           , presence: true
  # validates :phonenumber  , format: { with:  /\A\d{10}$|^\d{11}\z/ }

  has_many :items
  has_many :likes
  has_many :like_items, through: :likes, source: :item 
  has_many :comments
  has_many :orders
  has_one :adress
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

end