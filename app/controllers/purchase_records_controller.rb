class PurchaseRecordsController < ApplicationController

  def index
    @purchase_records = PurchaseRecordShoppinIinformation.new
  end




end
