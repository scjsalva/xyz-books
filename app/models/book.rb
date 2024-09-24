class Book < ApplicationRecord
  belongs_to :publisher
  has_and_belongs_to_many :authors

  validates :title, :isbn_13, :price, :publication_year, presence: true
end
