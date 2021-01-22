class OrderPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building,
                :phone_number, :purchase_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は半角のハイフンを含んだ正しい形式でないと保存できないこと' }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角漢字、全角ひらがな、全角カタカナ' }
    validates :phone_number, numericality: { with: /\A\d{11}\z/, message: 'は11桁以内でハイフンはしようできない、また半角数字でなければ使用できない' }
    validates :phone_number, length: { maximum: 11 }
    validates :token
  end
  # with: /^\d{10}$/, message: "は半角数字でハイフンは使用できない"
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality,
                 address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
