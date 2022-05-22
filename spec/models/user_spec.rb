require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user = FactoryBot.build(:user)
      # @user.nickname = ''
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_name,が空だと登録できない' do
      @user = FactoryBot.build(:user)
      # @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_name,が空だと登録できない' do
      @user = FactoryBot.build(:user)
      # @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_kana,が空だと登録できない' do
      @user = FactoryBot.build(:user)
      # @user.last_name_kana= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kana,が空だと登録できない' do
      @user = FactoryBot.build(:user)
      # @user.first_name_kana= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'birthday,が空だと登録できない' do
      @user = FactoryBot.build(:user)
      # @user.birthday= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'email,が空だと登録できない' do
      @user = FactoryBot.build(:user)
      # @user.email= ''
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include('')
    end

    it 'email,が一意性出ないと登録できない' do
      @user = FactoryBot.build(:user)
      # @user.email= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'email,が@を含んでいないと登録できない' do
      @user = FactoryBot.build(:user)
      # @user.email= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'password,が空だと登録できない' do
      @user = FactoryBot.build(:user)
      # @user.password= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'password,が6文字以上でないと登録できない' do
      @user = FactoryBot.build(:user)
      # @user.password= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user = FactoryBot.build(:user)
      # @user.password= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
  end
end
