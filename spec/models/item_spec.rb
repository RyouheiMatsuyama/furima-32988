require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能 正常系' do
    it '商品出品ができる' do
      expect(@item).to be_valid
    end
  end

  describe '商品出品機能 異常系' do
    it '商品画像を一枚つけることが必須である' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.details_category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Details category is not a number')
    end

    it '商品の状態についての情報が必須であること' do
      @item.details_state_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Details state is not a number')
    end

    it '配送料の負担についての情報が必須であること' do
      @item.shipping_fee_burden_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee burden is not a number')
    end

    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture is not a number')
    end

    it '発送までの日数についての情報が必須であること' do
      @item.days_to_ship_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to ship is not a number')
    end

    it '価格についての情報が必須であること' do
      @item.selling_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price can't be blank")
    end

    it '価格の範囲が、¥300からであること' do
      @item.selling_price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Selling price is not included in the list')
    end

    it '価格の範囲が、~¥9999999までであること' do
      @item.selling_price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Selling price is not included in the list')
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @item.selling_price = '７７７'
      @item.valid?
      expect(@item.errors.full_messages).to include('Selling price is not included in the list')
    end
  end
end
