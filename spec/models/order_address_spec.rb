require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '住所入力' do
    context '住所入力がうまくいくとき' do
      it '住所に関する全ての必須項目を埋めていれば購入できる' do
        expect(@order_address).to be_valid
      end      
    end

    context '住所入力がうまくいかないとき' do
      it '郵便番号が空だと登録出来ない' do
        @order_address.postal_code = nil
        @order_address.valid?
        binding.pry
        # expect(@order_address.errors.full_messages).to include()
      end
    end
  end
end
