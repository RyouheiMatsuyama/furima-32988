require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  describe '決済に必要な配送先情報と決済情報の保存' do
    before do
      seller = FactoryBot.create(:user)
      purchase = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: seller.id)
      @order_purchase = FactoryBot.build(:order_purchase, user_id: purchase.id, item_id: item.id)
      sleep(1)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@order_purchase).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @order_purchase.postal_code = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeは、半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_purchase.postal_code = 1_234_567
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include('Postal code は半角のハイフンを含んだ正しい形式でないと保存できないこと')
    end
    it 'prefecture_idは0(---)を選択すると保存できないこと' do
      @order_purchase.prefecture_id = 0
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'municipalityが空だと保存できないこと' do
      @order_purchase.municipality = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'buildingは空でも保存できること' do
      @order_purchase.building = nil
      expect(@order_purchase).to be_valid
    end
    it 'phone_numberは、ハイフンがあると保存できないこと' do
      @order_purchase.phone_number = '090-1234-5678'
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include('Phone number は11桁以内でハイフンはしようできない、また半角数字でなければ使用できない')
    end
    it 'phone_numberは、半角数字でなければ保存できないこと' do
      @order_purchase.phone_number = '０９０１２３４５６７８'
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include('Phone number は11桁以内でハイフンはしようできない、また半角数字でなければ使用できない')
    end
    it 'phone_numberは、11桁以内の半角数字でなければ保存できないこと' do
      @order_purchase.phone_number = '090123456789'
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
    it 'tokenがあれば保存ができること' do
      expect(@order_purchase).to be_valid
    end
    it 'tokenが空では登録できないこと' do
      @order_purchase.token = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
    end
  end
end
