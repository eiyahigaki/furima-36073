class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :charge
  belongs_to :area
  belongs_to :term

  belongs_to :user
  has_one_attached :image

  validates :title, :detail, :category_id, :state_id, :charge_id, :area_id, :term_id, presence:true

  validates :category_id, :state_id, :charge_id, :area_id, :term_id, numericality: { other_than: 1 , message: "can`t be blank"}
end
