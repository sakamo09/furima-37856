class ProductInformationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
 
  
  
  def index
  end

  def new
   @product_information = ProductInformation.new
  end

  def create
   @product_information = ProductInformation.new(product_information_params) 
   if @product_information.save
    redirect_to root_path
   else
    render :new
   end
  end








  private

  def product_information_params
   params.require(:product_information).permit(:image, :name, :description, :category_id, :situation_id, :load_id, :area_id, :period_id, :price ).merge(user_id: current_user.id)
  end
end
