class Book < ApplicationRecord
  belongs_to :publisher
  has_many :author_books
  has_many :authors, through: :author_books

  validates :title, :isbn_13, :price, :publication_year, presence: true
  validates :isbn_13, uniqueness: true
end
