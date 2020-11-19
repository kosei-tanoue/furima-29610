class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :order_id, :building_nane, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city, :house_number, :order_id, :building_nane, :item_id, :user_id
    validates :phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/}
  end

  def save
    Order.create(item_id: item.id, user_id: user.id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, order_id: order_id, building_nane: building_nane, phone_number: phone_number)
  end

end