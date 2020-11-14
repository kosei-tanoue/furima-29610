class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :place
  belongs_to :delivery_date

  with_options presence: true do
    validates :image, :name, :explain_item
    validates :price, inclusion: { in: 300..9999999 , message: "Out of setting range"}, numericality: { with: /\A[0-9]+\z/, message: "Half-width number" } 
    validates :category_id, :status_id, :delivery_fee_id, :place_id, :delivery_date_id, numericality: { other_than: 1 , message: "Select"}
  end
end
