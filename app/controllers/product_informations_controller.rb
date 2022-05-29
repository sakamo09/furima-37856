class ProductInformationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :set_tweet, only: [:show, :edit, :update, :destory]


  
  
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
  end

  def edit
    unless current_user == @product_information.user
      redirect_to root_path
    end
   end
  
  def update
    if @product_information.update(product_information_params)
      redirect_to product_information_path(@product_information)
    else
      render :edit
    end
  end

  def destroy
    if @product_information.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end







  private

  def product_information_params
   params.require(:product_information).permit(:image, :name, :description, :category_id, :situation_id, :load_id, :area_id, :period_id, :price ).merge(user_id: current_user.id)
  end

  def set_tweet
    @product_information = ProductInformation.find(params[:id])
  end

  

end
