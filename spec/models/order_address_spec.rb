require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, item_id: @item.id, user_id: @user.id)
    end
    describe '商品購入' do
      context '商品購入ができるとき' do
        it '全項目が存在すれば購入できること' do
          expect(@order_address).to be_valid
        end

        it 'buildingが空でも購入できること' do
          @order_address.building = nil
          expect(@order_address).to be_valid
        end
      end

      context '商品購入ができないとき' do
        it 'tokenが空では登録できないこと' do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end

        it 'postal_codeが空では登録できないこと' do
          @order_address.postal_code = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
        end

        it 'postal_codeに「-」が含まれていないと登録できないこと' do
          @order_address.postal_code = '1234567'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Postal code is invalid')
        end

        it 'postal_codeが3桁-4桁でないと登録できないこと' do
          @order_address.postal_code = '1234-567'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Postal code is invalid')
        end

        it 'prefectureが未選択では登録できないこと' do
          @order_address.prefecture_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
        end

        it 'cityが空では登録できないこと' do
          @order_address.city = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end

        it 'addressesが空では登録できないこと' do
          @order_address.addresses = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
        end

        it 'phone_numが空では登録できないこと' do
          @order_address.phone_num = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
        end

        it 'phone_numが12桁では登録できないこと' do
          @order_address.phone_num = '090123456789'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone num is invalid')
        end

        it 'phone_numに「-」が含まれると登録できないこと' do
          @order_address.phone_num = '090-1234-5678'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone num is invalid')
        end

        it 'item_idが空では登録できないこと' do
          @order_address.item_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end

        it 'user_idが空では登録できないこと' do
          @order_address.user_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
      end
    end
  end
end
