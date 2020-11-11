require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '同じemailでは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailは＠がないと登録できない' do
      @user.email = "specuser"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameは全角でないと登録できない' do
      @user.first_name = "aa"
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameは全角でないと登録できない' do
      @user.last_name = "aa"
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end
    it 'first_readingが空では登録できない' do
      @user.first_reading = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First reading can't be blank")
    end
    it 'first_readingはカタカナでないと登録できない' do
      @user.first_reading = "すぺっく"
      @user.valid?
      expect(@user.errors.full_messages).to include('First reading Full-width katakana characters')
    end
    it 'last_readingが空では登録できない' do
      @user.last_reading = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last reading can't be blank")
    end
    it 'last_readingはカタカナでないと登録できない' do
      @user.last_reading = "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include('Last reading Full-width katakana characters')
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordは英数字混合でないと登録できない' do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
