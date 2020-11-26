require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入機能' do
    context '購入がうまくいくとき' do
      it 'クレジットカードの情報、住所に関する全ての必須項目を埋めていれば購入できる' do
        expect(@order_address).to be_valid
      end

      it 'building_nameは空でも登録できる' do
        @order_address.building_name = ""
        @order_address.valid?
      end
    end

    context '購入がうまくいかないとき' do
      it 'tokenが空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと購入出来ない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code Input correctly')
      end

      it '郵便番号が数字ではない値が入力されていた場合、購入できない' do
        @order_address.postal_code = 'テスト'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code Input correctly')
      end

      it '郵便番号にハイフンなしだと購入できない' do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code Input correctly')
      end

      
      it '都道府県が選択されていなければ購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture Select')
      end
      
      it '市町村が入力されていなければ購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      
      it '番地が入力されていなければ購入できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      
      it '電話番号が入力されていないければ購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number Input only number')
      end
      
      it '電話番号が12桁以上では購入できない' do
        @order_address.phone_number = "12345678901234"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      
      it '電話番号にハイフンが含まれていると購入できない' do
        @order_address.phone_number = '090-1111-1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input only number')
      end

      it '電話番号に数字以外のものが入力されていると購入できない' do
        @order_address.phone_number = 'aaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Input only number')
      end
    end
  end
end
