class History < ApplicationRecord
  attr_accessor :token
  belongs_to :item
  has_one :delivery

  validates :token, presence:true
end
