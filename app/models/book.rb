class Book < ApplicationRecord
  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :requests, dependent: :destroy
  mount_uploader :image, ImageUploader

  scope :order_alphabet, -> {order title: :ASC}

  def avg_rate
    rate = Rate.rates_of_book self.id
    unless rate
      flash[:danger] = t "rate_not_found"
    end
    total_rate = 0
    rate.each do |book|
      total_rate += book.num_rate.to_f
    end
    total_rate/rate.size.to_i unless rate.size.to_i == 0
  end

  private
  def image_size
    if image.size > Settings.size_image.megabytes
      errors.add :image, t("error_image")
    end
  end

  scope :find_of_diffrent_category, -> type, keyword do
    where "#{type} like ?", "%#{keyword}%"
  end
end
