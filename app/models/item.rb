class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :place
  belongs_to :delivery_date

  with_options presence: true do
    validates :category_id, :status_id, :delivery_fee_id, :place_id, :delivery_date_id, numericality: { other_than: 1 }

  end
end
