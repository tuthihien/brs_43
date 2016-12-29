class Book < ApplicationRecord
  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :requests, dependent: :destroy
  mount_uploader :image, ImageUploader

  scope :order_alphabet, -> {order title: :ASC}

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
