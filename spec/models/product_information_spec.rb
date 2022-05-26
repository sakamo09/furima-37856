require 'rails_helper'

RSpec.describe ProductInformation, type: :model do
  before do
    @product_information= FactoryBot.build(:product_information)
  end

  describe '商品出品機能' do
    
    context '商品出品できるとき' do
      it ' image,name,description,category_id,situation_id,load_id,area_id,period_id,priceが全て入力されているとき' do
        expect(@product_information).to be_valid
      end
    end

    context '新規登録できないとき' do
      
     it 'image,が空では登録できない' do
      @product_information.image = nil
      @product_information.valid?
       expect(@product_information.errors.full_messages).to include("Image can't be blank")
      end

     it 'name,が空では登録できない' do
      @product_information.name = ''
      @product_information.valid?
       expect(@product_information.errors.full_messages).to include("Name can't be blank")
      end

     it 'description,が空では登録できない' do
      @product_information.description = ''
      @product_information.valid?
       expect(@product_information.errors.full_messages).to include("Description can't be blank")
      end

     it 'category_id,が空では登録できない' do
      @product_information.category_id = ''
      @product_information.valid?
       expect(@product_information.errors.full_messages).to include("Category can't be blank")
      end

     it 'situation_id,が空では登録できない' do
      @product_information.situation_id = ''
      @product_information.valid?
       expect(@product_information.errors.full_messages).to include("Situation can't be blank")
      end

     it 'load_id,が空では登録できない' do
      @product_information.load_id = ''
      @product_information.valid?
       expect(@product_information.errors.full_messages).to include("Load can't be blank")
      end

     it 'area_id,が空では登録できない' do
      @product_information.area_id = ''
      @product_information.valid?
       expect(@product_information.errors.full_messages).to include("Area can't be blank")
      end
   
     it 'period_id,が空では登録できない' do
      @product_information.period_id = ''
      @product_information.valid?
       expect(@product_information.errors.full_messages).to include("Period can't be blank")
      end
     
      it 'price,が空では登録できない' do
        @product_information.price = ''
        @product_information.valid?
         expect(@product_information.errors.full_messages).to include("Price can't be blank")
        end
     
      it 'priceが¥300~¥9,999,999でないと登録できない' do
          @product_information.price = '10'
          @product_information.valid?
           expect(@product_information.errors.full_messages).to include("Price can't be blank")
          end
     
       it 'priceが半角数値でないと登録できない' do
          @product_information.image = nil
          @product_information.valid?
           expect(@product_information.errors.full_messages).to include("Image can't be blank")
       end
   

   end
 end
end
