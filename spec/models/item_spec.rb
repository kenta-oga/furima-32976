require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
  end

    it '全項目が存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'infoが空では登録できないこと' do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it 'category_idが1では登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'status_idが1では登録できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it 'shipping_idが1では登録できないこと' do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping must be other than 1")
    end

    it 'prefecture_idが1では登録できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'schedule_idが1では登録できないこと' do
      @item.schedule_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Schedule must be other than 1")
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが299以下では登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'priceが10000000以上では登録できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'priceが300以上であれば登録できること' do
      @item.price = 300
      expect(@item).to be_valid
    end

    it 'priceが9999999以下であれば登録できること' do
      @item.price = 9999999
      expect(@item).to be_valid
    end

    it 'priceが全角数字では登録できないこと' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
  end
end

