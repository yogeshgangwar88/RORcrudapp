class Book < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[a-zA-Z0-9_ \.]+\z/, message: "is not valid" }
  validates :author, :price, :category, { presence: true }

  validates :price, numericality: { only_integer: true, greater_than: -1 }
end
