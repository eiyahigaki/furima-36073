class HistoryDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :address, :building, :tel, :token

  with_options presence: true do
    validates :user_id, :item_id, :city, :address, :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :tel, format: { with: /\A[0-9]{10,11}\z/ }
  end
  validates :area_id, numericality: { other_than: 1, message: 'can`t be blank' }

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building: building, tel: tel,
                    history_id: history.id)
  end
end
