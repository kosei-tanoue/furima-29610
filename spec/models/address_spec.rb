require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '住所入力' do
    context '住所入力がうまくいくとき' do
      it '住所に関する全ての必須項目を埋めていれば購入できる' do
        expect(@address).to be_valid
      end
    end

    context '住所入力がうまくいかないとき' do
      it '郵便番号が空だと登録出来ない' do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
    end
  end
end
