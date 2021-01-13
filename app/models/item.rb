class Item < ApplicationRecord
  with_options presence: true do
    validates :name,                   length: { maximum: 40 }
    validates :explanation,            length: { maximum: 1000 }
  end

  with_options numericality: { other_than: 1, message: 'を入力' } do
    validates :details_category_id
    validates :details_state_id
    validates :shipping_fee_burden_id
    validates :days_to_ship_id
  end

  validates :prefecture_id, numericality: { other_than: 0, message: 'を入力' }

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字で入力' } do
    validates :selling_price, length: { maximum: 1000 }
  end

  validates_inclusion_of :selling_price, in: 300..9_999_999
  validates :image

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
