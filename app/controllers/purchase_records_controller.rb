class PurchaseRecordsController < ApplicationController

  def index
    @purchase_records = PurchaseRecordShoppingInformation.new
    @product_information = ProductInformation.find(params[:product_information_id])
  end


  def create
    # PurchaseRecord.create(purchase_record_params)
  end



  # private
  # def purchase_record_params
  #   params.require(:purchase_record).permit(:postal_code, :area_id, :municipalities, :address, :building_name, :telephone_number)
  # end


end
