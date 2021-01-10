class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true, length: { maximum: 40 }

  # 半角英数字
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password,              format: { with: VALID_PASSWORD_REGEX }
  validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :last_name,       presence: true
    validates :first_name,      presence: true
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' } do
    validates :first_name_kana, presence: true
    validates :last_name_kana,  presence: true
  end

  validates :birth_date, presence: true

  has_many :listings
  has_many :purchases
end
