require 'rails_helper'

RSpec.describe User, type: :model do
   before do
    @user = FactoryBot.build(:user)
   end
 
 
describe 'ユーザー新規登録' do
   
  context '新規登録できるとき' do
      it ' nickname,last_name,first_name, last_name_kana,first_name_kana,birthday, email, passwordが全て入力されているとき' do
        expect(@user).to be_valid
      end
      end
    
    context '新規登録できないとき' do
      
       it 'nickname,が空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
       end

      it 'last_name,が空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_name,が空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name_kana,が空だと登録できない' do
      @user.last_name_kana= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_name_kana,が空だと登録できない' do
      @user.first_name_kana= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'birthday,が空だと登録できない' do
      @user.birthday= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'email,が空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end
    
      it 'email,が重複している場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'email,が@を含んでいないと登録できない' do
      @user.email= 'hogehoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'password,が空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'password,が6文字以上でないと登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it 'password,とpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    
      it 'password,が英字のみでは登録できない' do
      @user.password= 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it 'password,が数字のみでは登録できない' do
      @user.password= '7777'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it 'password,が全角のみでは登録できない' do
      @user.password= 'AAA'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it 'last_name,が半角文字が含まれている場合は登録できない' do
      @user.last_name= 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end

      it 'first_name,が半角文字が含まれている場合は登録できない' do
      @user.first_name= 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end

      it 'last_name_kana,がカタカナ以外の文字（ひらがなや漢字）が含まれている場合は登録できない' do
      @user.last_name_kana= 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end


      it 'first_name_kana,がカタカナ以外の文字（ひらがなや漢字）が含まれている場合は登録できない' do
      @user.first_name_kana= 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
    end
  end
 end
