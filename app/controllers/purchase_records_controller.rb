class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product_information
  before_action :contributor_confirmation

  def index
    @purchase_records = PurchaseRecordShoppingInformation.new
  end

  def create
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
    params.require(:purchase_record_shopping_information).permit(:postal_code, :area_id, :municipalities, :address, :building_name, :telephone_number).merge(
      user_id: current_user.id, product_information_id: params[:product_information_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product_information[:price],
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end

  def contributor_confirmation
    redirect_to root_path if @product_information.purchase_record.present? || current_user.id == @product_information.user.id
  end

  def set_product_information
    @product_information = ProductInformation.find(params[:product_information_id])
  end
end
