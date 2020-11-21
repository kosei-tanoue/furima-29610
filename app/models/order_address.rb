class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :order_id, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city, :house_number
    validates :phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/, message: "Input only number"}
  end

  def save
    # item = Item.create(name: name, price: price, explain_item: explain_item, category_id: category_id, status_id: status_id, delivery_fee_id: delivery_fee_id)
    # user = User.create(nickname: nickname, first_name: first_name, last_name: last_name, first_name: first_name, last_reading: last_reading, first_reading: first_reading, email: email, password: password)¥
    # item = Item.find(params[:id])
    # user = User.find(params[:id])

    Order.create(item_id: item_id, user_id: user_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, order_id: order_id, building_name: building_name, phone_number: phone_number)
  end

end