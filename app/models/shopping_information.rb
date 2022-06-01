class ShoppingInformation < ApplicationRecord
  belongs_to :purchase_record

  validates :postal_code, presence: true
  validates :area_id, presence: true, { other_than: 1 , message: "can't be blank"}
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
end
