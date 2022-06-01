class PurchaseRecordsController < ApplicationController

  def index
    @purchase_records = PurchaseRecordShoppingInformation.new
    @product_information = ProductInformation.find(params[:product_information_id])
  end



  def create
    @product_information = ProductInformation.find(params[:product_information_id])
    # binding.pry
    @purchase_records = PurchaseRecordShoppingInformation.new(purchase_record_params)
    if @purchase_records.valid?
      @purchase_records.save
      redirect_to root_path
    else
      render :index
    end
  end

  
  private
  
  def purchase_record_params
    params.require(:purchase_record_shopping_information).permit(:postal_code, :area_id, :municipalities, :address, :building_name, :telephone_number).merge(user_id: current_user.id, product_information_id: params[:product_information_id])

  end

 

end
