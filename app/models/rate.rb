class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :book

  scope :rates_of_book, -> book_id do
    where book_id: book_id
  end
end
