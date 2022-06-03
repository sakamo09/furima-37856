class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :contributor_confirmation, only: [:index, :create]

  def index
    @purchase_records = PurchaseRecordShoppingInformation.new
    @product_information = ProductInformation.find(params[:product_information_id])
  end





  def create
    @product_information = ProductInformation.find(params[:product_information_id])
    @purchase_records = PurchaseRecordShoppingInformation.new(purchase_record_params)
    if @purchase_records.valid?
      pay_item
      @purchase_records.save
      redirect_to root_path
    else
      render :index
    end
  end

  
  private
  
  def purchase_record_params
    params.require(:purchase_record_shopping_information).permit(:postal_code, :area_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, product_information_id: params[:product_information_id], token: params[:token])

  end
  
  def  pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product_information[:price],  
        card: purchase_record_params[:token],   
        currency: 'jpy'                 
      )
  end

  def contributor_confirmation
    unless @purchase_record_id.present?
    redirect_to root_path 
    end
  end
 

end
