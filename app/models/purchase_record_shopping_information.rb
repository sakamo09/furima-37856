class PurchaseRecordShoppinIinformation
include ActiveModel::Model
attr_accessor :postal_code, :area_id , :municipalities, :address, :building_name, :telephone_number, :user_id, :product_information_id

 with_options presence: true do
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :area_id
  validates :municipalities
  validates :address
  # validates :building_name
  validates :telephone_number
  validates :user_id
  validates :product_information_id
  end
  
  
  def save
    
    purchase_record = PurchaseRecord.create(product_information_id: product_information_id, user_id: user_id)
  
    ShoppinIinformation.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, address: aderess, building_name: building_name,  donation_id: telephone_number: telephone_number, product_information_id: product_information_id)
  end





end