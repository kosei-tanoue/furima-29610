require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it '全ての項目を正しく埋めていれば、商品を出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '画像が添付されていなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明がなければ登録できない' do
        @item.explain_item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain item can't be blank")
      end

      it '値段を入力していなければ登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '値段が299円以下だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it '値段が10000000円以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end

      it '値段は半角数字でなければ登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end

      it 'カテゴリーを選択しなければ登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it '商品状態を選択しなければ登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end

      it '配送料の負担額を選択しなければ登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee Select')
      end

      it '配送元の地域を選択しなければ登録できない' do
        @item.place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Place Select')
      end

      it '発送までの日数を選択しなければ登録できない' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery date Select')
      end
    end
  end
end
