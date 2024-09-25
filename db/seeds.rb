# Publishers
publishers = [
  { name: "Paste Magazine" },
  { name: "Publishers Weekly" },
  { name: "Graywolf Press" },
  { name: "McSweeney's" },
  { name: "Top Shelf Productions" }
]

publisher_objects = publishers.map do |publisher_data|
  Publisher.find_or_create_by!(publisher_data)
rescue ActiveRecord::RecordInvalid => e
  puts "Error creating publisher: #{e.message}"
  nil
end.compact

# Authors
authors = [
  { first_name: "Joel", last_name: "Hartse" },
  { first_name: "Hannah", middle_name: "P.", last_name: "Templer" },
  { first_name: "Marguerite", middle_name: "Z.", last_name: "Duras" },
  { first_name: "Kingsley", last_name: "Amis" },
  { first_name: "Fannie", middle_name: "Peters", last_name: "Flagg" },
  { first_name: "Camille", middle_name: "Byron", last_name: "Paglia" },
  { first_name: "Rainer", middle_name: "Steel", last_name: "Rilke" },
  { first_name: "Balazs", last_name: "Lorinczi" },
  { first_name: "Peter", last_name: "Hoey" },
  { first_name: "Maria", last_name: "Hoey" }
]

author_objects = authors.map do |author_data|
  Author.find_or_create_by!(author_data)
rescue ActiveRecord::RecordInvalid => e
  puts "Error creating author: #{e.message}"
  nil
end.compact

# Books
books = [
  { isbn_13: "978-1-603095-13-6", title: "Doughnuts & Doom", isbn_10: "1-603-09513-6", price: 763.00, publication_year: 2022, edition: "Book 3", cover_url: "Doughnuts & Doom.png", publisher: publisher_objects.find { |p| p.name == "McSweeney's" } },
  { isbn_13: "978-1-603095-09-9", title: "The Bend of Luck", isbn_10: "1-603-09509-8", price: 701.00, publication_year: 2022, edition: "Book 1", cover_url: "The Bend of Luck.png", publisher: publisher_objects.find { |p| p.name == "Top Shelf Productions" } },
  { isbn_13: "978-1-891830-85-3", title: "American Elf", isbn_10: "1-891-83085-6", price: 1000.00, publication_year: 2004, edition: "Book 2", cover_url: "American Elf.png", publisher: publisher_objects.find { |p| p.name == "Paste Magazine" } },
  { isbn_13: "978-1-60309-454-2", title: "Cosmoknights", isbn_10: "1-603-09454-7", price: 2000.00, publication_year: 2019, edition: "Book 1", cover_url: "Cosmoknights.png", publisher: publisher_objects.find { |p| p.name == "Publishers Weekly" } },
  { isbn_13: "978-1-60309-038-4", title: "Essex County", isbn_10: "1-603-09038-X", price: 500.00, publication_year: 1990, edition: nil, cover_url: "Essex County.png", publisher: publisher_objects.find { |p| p.name == "Graywolf Press" } },
  { isbn_13: "978-1-891830-02-0", title: "Hey, Mister (Vol 1)", isbn_10: "1-891-83002-3", price: 1200.00, publication_year: 2000, edition: "After School Special", cover_url: "Hey, Mister (Vol 1).png", publisher: publisher_objects.find { |p| p.name == "Graywolf Press" } },
  { isbn_13: "978-1-60309-398-9", title: "The Underwater Welder", isbn_10: "1-603-09398-2", price: 3000.00, publication_year: 2022, edition: nil, cover_url: "The Underwater Welder.png", publisher: publisher_objects.find { |p| p.name == "McSweeney's" } }
]

book_objects = books.map do |book_data|
  Book.find_or_create_by!(isbn_13: book_data[:isbn_13]) do |book|
    book.assign_attributes(book_data)
  end
rescue ActiveRecord::RecordInvalid => e
  puts "Error creating book: #{e.message}"
  nil
end.compact

# AuthorBooks
author_books = [
  { author: "Balazs Lorinczi", book: "Doughnuts & Doom" },
  { author: "Peter Hoey", book: "The Bend of Luck" },
  { author: "Maria Hoey", book: "The Bend of Luck" },
  { author: "Joel Hartse", book: "American Elf" },
  { author: "Hannah Templer", book: "American Elf" },
  { author: "Marguerite Duras", book: "American Elf" },
  { author: "Kingsley Amis", book: "Cosmoknights" },
  { author: "Kingsley Amis", book: "Essex County" },
  { author: "Hannah Templer", book: "Hey, Mister (Vol 1)" },
  { author: "Fannie Flagg", book: "Hey, Mister (Vol 1)" },
  { author: "Camille Paglia", book: "Hey, Mister (Vol 1)" },
  { author: "Rainer Rilke", book: "The Underwater Welder" }
]

author_books.each do |ab|
  author = author_objects.find { |a| "#{a.first_name} #{a.last_name}" == ab[:author] }
  book = book_objects.find { |b| b.title == ab[:book] }
  
  if author && book
    AuthorBook.find_or_create_by!(author: author, book: book)
  else
    puts "Error: Author or Book not found for #{ab[:author]} - #{ab[:book]}"
  end
rescue ActiveRecord::RecordInvalid => e
  puts "Error creating author-book association: #{e.message}"
end