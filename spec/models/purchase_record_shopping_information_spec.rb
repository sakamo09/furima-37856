require 'rails_helper'

RSpec.describe PurchaseRecordShoppingInformation, type: :model do
  before do
    user = FactoryBot.create(:user)
    product_information = FactoryBot.create(:product_information)
    @purchase_record_shopping_information = FactoryBot.build(:purchase_record_shopping_information, user_id: user.id, product_information_id: product_information.id)
    sleep(0.1)
  end
 

 describe '商品購入機能' do

  context '商品購入できるとき' do
    it 'postal_code,area_id,municipalities,address,telephone_numberが全て入力されているとき' do
      expect(@purchase_record_shopping_information).to be_valid
    end

    it 'building_name,が空でも登録できる' do
      @purchase_record_shopping_information.building_name = ''
      expect(@purchase_record_shopping_information).to be_valid
    end

    

  context '商品購入できないとき' do
   
    it 'postal_code,が空では購入できない' do
      @purchase_record_shopping_information.postal_code = ''
      @purchase_record_shopping_information.valid?
      expect(@purchase_record_shopping_information.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_code,は「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
      @purchase_record_shopping_information.postal_code = '000'
      @purchase_record_shopping_information.valid?
      expect(@purchase_record_shopping_information.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it 'area_id,が空では購入できない' do
      @purchase_record_shopping_information.area_id = ''
      @purchase_record_shopping_information.valid?
      expect(@purchase_record_shopping_information.errors.full_messages).to include("Area can't be blank")
    end

    it 'area_id,に「---」が選択されている場合は購入できない' do
      @purchase_record_shopping_information.area_id = '1'
      @purchase_record_shopping_information.valid?
       expect(@purchase_record_shopping_information.errors.full_messages).to include("Area can't be blank")
     end

    it 'municipalities,が空では購入できない' do
      @purchase_record_shopping_information.municipalities = ''
      @purchase_record_shopping_information.valid?
      expect(@purchase_record_shopping_information.errors.full_messages).to include("Municipalities can't be blank")
    end

    it 'address,が空では購入できない' do
      @purchase_record_shopping_information.address = ''
      @purchase_record_shopping_information.valid?
      expect(@purchase_record_shopping_information.errors.full_messages).to include("Address can't be blank")
    end

    it 'telephone_number,が空では購入できない' do
      @purchase_record_shopping_information.telephone_number = ''
      @purchase_record_shopping_information.valid?
      expect(@purchase_record_shopping_information.errors.full_messages).to include("Telephone number can't be blank")
    end

    it 'telephone_number,は9桁以下では購入できない' do
      @purchase_record_shopping_information.telephone_number = '000'
      @purchase_record_shopping_information.valid?
      expect(@purchase_record_shopping_information.errors.full_messages).to include("Telephone number is invalid")
    end

    it 'telephone_number,は12桁以上では購入できない' do
      @purchase_record_shopping_information.telephone_number = '000000000000000000000'
      @purchase_record_shopping_information.valid?
      expect(@purchase_record_shopping_information.errors.full_messages).to include("Telephone number is invalid")
    end
    
      
      it 'telephone_number,に半角英数以外が含まれている時は購入できない' do
        @purchase_record_shopping_information.telephone_number = 'ああ'
        @purchase_record_shopping_information.valid?
        expect(@purchase_record_shopping_information.errors.full_messages).to include("Telephone number is invalid")
      end


    it "tokenが空では購入できないこと" do
      @purchase_record_shopping_information.token = nil
      @purchase_record_shopping_information.valid?
      expect(@purchase_record_shopping_information.errors.full_messages).to include("Token can't be blank")
    end


    it 'user,が紐付いていなければ購入できない' do
      @purchase_record_shopping_information.user_id = nil
      @purchase_record_shopping_information.valid?
       expect(@purchase_record_shopping_information.errors.full_messages).to include("User can't be blank")
     end

     it 'product_information,が紐付いていなければ購入できない' do
      @purchase_record_shopping_information.product_information_id = nil
      @purchase_record_shopping_information.valid?
       expect(@purchase_record_shopping_information.errors.full_messages).to include("Product information can't be blank")
     end

   











   end
  end
 end
end
