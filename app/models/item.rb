class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state

  belongs_to :user
  has_one_attached :image

  validates :title, :detail, :category_id, :state_id, presence:true

  validates :category_id, :state_id, numericality: { other_than: 1 , message: "can`t be blank"}
end
