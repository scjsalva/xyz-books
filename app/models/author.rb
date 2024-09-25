class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books

  validates :first_name, :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name, message: "and last name combination must be unique" }

  def name
    name = []
    name << self.first_name&.strip
    name << self.middle_name&.strip
    name << self.last_name&.strip
    name.join(" ")
  end
end
