class ProductInformation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :load
  belongs_to :area
  belongs_to :period
  
  
  has_one_attached :image
  
  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :load_id , presence: true
  validates :area_id , presence: true
  validates :period_id , presence: true
  validates :price  , presence: true
  
  belongs_to :user 
  # has_one :purchase_record

end
