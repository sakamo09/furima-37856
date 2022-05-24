class ProductInformation < ApplicationRecord
  has_one_attached :image

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  # belongs_to :user 
  # has_one :purchase_record

end
