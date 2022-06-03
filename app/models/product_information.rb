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
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :load_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :period_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 999_999, message: 'is invalid' }

  belongs_to :user
  has_one :purchase_record
end
