class ProductInformation < ApplicationRecord
  has_one_attached :image
  # belongs_to :user 
  # has_one :purchase_record

end
