class Book < ApplicationRecord
  belongs_to :category
  validates :name, presence: true, format: { with: /\A[a-zA-Z0-9_ \.]+\z/, message: "is not valid" }
  validates :author, :price, :category_id, { presence: true }

  validates :price, numericality: { only_integer: true, greater_than: -1 }

  validate :validate_category

  private

  def validate_category
    if (Category.find(category_id) rescue nil) == nil
      errors.add(:category_id, "is not valid")
    end
  end
end
