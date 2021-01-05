class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_num, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :addresses
    validates :phone_num
  end

  def save
    order = Order.create(item_id: @item.id, user_id: current_user.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture.id, city: city, addresses: addresses, building: building, order_id: order.id)
  end
end