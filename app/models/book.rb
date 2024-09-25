class Book < ApplicationRecord
  belongs_to :publisher
  has_many :author_books
  has_many :authors, through: :author_books

  validates :title, :isbn_13, :price, :publication_year, presence: true
  validates :isbn_13, uniqueness: true

  before_validation :validate_isbn, on: :create

  private

  def validate_isbn
    self.isbn_13 = ISBNHandler.call(self.isbn_13, 'ISBN-13', false) if self.isbn_13.present?
    self.isbn_10 = ISBNHandler.call(self.isbn_10, 'ISBN-10', false) if self.isbn_10.present?
  rescue ISBNHandler::InvalidISBNError => e
    puts e
    errors.add(:isbn_13, e.message)
  end
end
