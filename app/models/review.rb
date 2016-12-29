class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  scope :order_by_date, -> {order created_at: :desc}
end
