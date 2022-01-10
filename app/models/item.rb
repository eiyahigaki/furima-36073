class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :category
  belongs_to :state
  belongs_to :charge
  belongs_to :area
  belongs_to :term

  belongs_to :user
  has_one_attached :image
  has_one :history

  validates :title, :detail, :image, presence: true
  validates :category_id, :state_id, :charge_id, :area_id, :term_id, numericality: { other_than: 1, message: 'can`t be blank' }
  validates :price, presence: true, numericality: true, inclusion: { in: 300..9_999_999, only_integer: true }
end
