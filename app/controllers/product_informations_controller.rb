class ProductInformationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  
  
  def index
    @product_informations = ProductInformation.all.order("created_at DESC")
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

  def show
    @product_information = ProductInformation.find(params[:id])
  end

  def edit
    @product_information = ProductInformation.find(params[:id])
    # redirect_to root_path unless current_user == @product_information.user
  end
  
  def update
    @product_information = ProductInformation.find(params[:id])
    if @product_information.update(product_information_params)
      redirect_to product_information_path(@product_information)
    else
      render :edit
    end
  end






  private

  def product_information_params
   params.require(:product_information).permit(:image, :name, :description, :category_id, :situation_id, :load_id, :area_id, :period_id, :price ).merge(user_id: current_user.id)
  end

  

end
