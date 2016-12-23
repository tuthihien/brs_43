class Category < ApplicationRecord
  has_many :books, dependent: :destroy

  scope :order_date_desc, -> {order created_at: :desc}
end
