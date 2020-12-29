require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    describe '商品新規登録' do
      context '商品新規登録できるとき' do
        it '全項目が存在すれば登録できること' do
          expect(@item).to be_valid
        end
      end
      context '商品新規登録できないとき' do
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

        it 'categoryが未選択では登録できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end

        it 'statusが未選択では登録できないこと' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Status must be other than 1')
        end

        it 'shippingが未選択では登録できないこと' do
          @item.shipping_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping must be other than 1')
        end

        it 'prefectureが未選択では登録できないこと' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
        end

        it 'scheduleが未選択では登録できないこと' do
          @item.schedule_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Schedule must be other than 1')
        end

        it 'priceが空では登録できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'priceが299以下では登録できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end

        it 'priceが10000000以上では登録できないこと' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end

        it 'priceが半角数字以外では登録できないこと' do
          @item.price = '３００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end
      end
    end
  end
end
