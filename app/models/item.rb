class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :schedule
  belongs_to :user
  has_one_attached :image

  validates :name,          presence: true
  validates :info,          presence: true
  validates :category_id,   numericality: { other_than: 1 } 
  validates :status_id,     numericality: { other_than: 1 } 
  validates :shipping_id,   numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :schedule_id,   numericality: { other_than: 1 } 
  validates :price,         presence: true, inclusion: { in: 300..9999999 }
end
