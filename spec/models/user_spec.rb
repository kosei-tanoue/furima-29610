require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "test@spec", password: "spec1234", password_confirmation: "spec1234")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "spec", email: "", password: "spec1234", password_confirmation: "spec1234")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = User.new(nickname: "spec", email: "test@spec", first_name: "", last_name:"太郎", first_reading:"スペック", last_reading:"タロウ", birthday:"1930-01-01", password: "spec1234", password_confirmation: "spec1234")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameは全角でないと登録できない" do
      user = User.new(nickname: "spec", email: "test@spec", first_name: "aa", last_name:"太郎", first_reading:"スペック", last_reading:"タロウ", birthday:"1930-01-01", password: "spec1234", password_confirmation: "spec1234")
      user.valid?
      expect(user.errors.full_messages).to include("First name Full-width characters")
    end
    it "last_nameが空では登録できない" do
      user = User.new(nickname: "spec", email: "test@spec", first_name: "スペック", last_name:"", first_reading:"スペック", last_reading:"タロウ", birthday:"1930-01-01", password: "spec1234", password_confirmation: "spec1234")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_nameは全角でないと登録できない" do
      user = User.new(nickname: "spec", email: "test@spec", first_name: "スペック", last_name:"tarou", first_reading:"スペック", last_reading:"タロウ", birthday:"1930-01-01", password: "spec1234", password_confirmation: "spec1234")
      user.valid?
      expect(user.errors.full_messages).to include("Last name Full-width characters")
    end
    it "first_readingが空では登録できない" do
      user = User.new(nickname: "spec", email: "test@spec", first_name: "スペック", last_name:"太郎", first_reading:"", last_reading:"タロウ", birthday:"1930-01-01", password: "spec1234", password_confirmation: "spec1234")
      user.valid?
      expect(user.errors.full_messages).to include("First reading can't be blank")
    end
    it "first_readingはカタカナでないと登録できない" do
      user = User.new(nickname: "spec", email: "test@spec", first_name: "スペック", last_name:"太郎", first_reading:"すぺっく", last_reading:"タロウ", birthday:"1930-01-01", password: "spec1234", password_confirmation: "spec1234")
      user.valid?
      expect(user.errors.full_messages).to include("First reading Full-width katakana characters")
    end
    it "last_readingが空では登録できない" do
        user = User.new(nickname: "spec", email: "test@spec", first_name: "スペック", last_name:"太郎", first_reading:"スペック", last_reading:"", birthday:"1930-01-01", password: "spec1234", password_confirmation: "spec1234")
        user.valid?
        expect(user.errors.full_messages).to include("Last reading can't be blank")
    end
    it "last_readingはカタカナでないと登録できない" do
      user = User.new(nickname: "spec", email: "test@spec", first_name: "スペック", last_name:"太郎", first_reading:"スペック", last_reading:"たろう", birthday:"1930-01-01", password: "spec1234", password_confirmation: "spec1234")
      user.valid?
      expect(user.errors.full_messages).to include("Last reading Full-width katakana characters")
    end
    it "birthdayが空では登録できない" do
      user = User.new(nickname: "spec", email: "test@spec", first_name: "スペック", last_name:"太郎", first_reading:"スペック", last_reading:"", birthday:"", password: "spec1234", password_confirmation: "spec1234")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(nickname: "spec", email: "test@spec", first_name: "スペック", last_name:"太郎", first_reading:"スペック", last_reading:"タロウ", birthday:"1930-01-01", password: "", password_confirmation: "spec1234")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordは英数字混合でないと登録できない" do
      user = User.new(nickname: "spec", email: "test@spec", first_name: "スペック", last_name:"太郎", first_reading:"スペック", last_reading:"タロウ", birthday:"1930-01-01", password: "aaaaaa", password_confirmation: "aaaaaa")
      user.valid?
      expect(user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it "password_confirmationが空では登録できない" do
      user = User.new(nickname: "spec", email: "test@spec", first_name: "スペック", last_name:"太郎", first_reading:"スペック", last_reading:"タロウ", birthday:"1930-01-01", password: "spec1234", password_confirmation: "")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
