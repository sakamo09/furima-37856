class PurchaseRecordsController < ApplicationController

  def index
    @purchase_records = PurchaseRecordShoppingInformation.new
    @product_information = ProductInformation.find(params[:product_information_id])
  end



end
