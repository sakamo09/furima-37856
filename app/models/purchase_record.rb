class PurchaseRecord < ApplicationRecord
belongs_to :user 
belongs_to :product_information
has_one :shopping_information


end
