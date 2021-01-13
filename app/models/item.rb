class Item < ApplicationRecord
  validates :name,                   presence: true, length: { maximum: 40 }
  validates :explanation,            presence: true, length: { maximum: 1000 }
  validates :details_category_id,    numericality: { other_than: 1 }
  validates :details_state_id,       numericality: { other_than: 1 }
  validates :shipping_fee_burden_id, numericality: { other_than: 1 }
  validates :prefecture_id,          numericality: { other_than: 0 }
  validates :days_to_ship_id,        numericality: { other_than: 1 }

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字で入力' } do
    validates :selling_price, length: { maximum: 1000 }
  end
  validates_inclusion_of :selling_price, in: 300..9_999_999
  validates :image, presence: true

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :details_category
  belongs_to :details_state
  belongs_to :shipping_fee_burden
  belongs_to :prefecture
  belongs_to :days_to_ship
end
