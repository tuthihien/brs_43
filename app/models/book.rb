class Book < ApplicationRecord
  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :requests, dependent: :destroy
end
