class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city, :house_number, :token
    validates :phone_number, numericality: { with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/, message: 'Input only number' }
    validates :phone_number, length: { maximum: 11 }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, order_id: order.id, building_name: building_name, phone_number: phone_number)
  end
end
