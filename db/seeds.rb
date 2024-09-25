# Publishers
publishers = [
  { name: "Paste Magazine" },
  { name: "Publishers Weekly" },
  { name: "Graywolf Press" },
  { name: "McSweeney's" },
  { name: "Top Shelf Productions" }
].map { |pub| Publisher.find_or_create_by!(pub) }

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
  { first_name: "Maria", last_name: "Hoey" },
  { first_name: "Jeff", last_name: "Lemire" },
].map { |auth| Author.find_or_create_by!(auth) }

# Books
books = [
  {
    title: "Doughnuts & Doom",
    isbn_13: "978-1-603095-13-6",
    isbn_10: "1-603-09513-6",
    price: 763.00,
    publication_year: 2022,
    edition: "Book 3",
    cover_url: "Doughnuts & Doom.png",
    publisher: publishers[3] # McSweeney's
  },
  {
    title: "The Bend of Luck",
    isbn_13: "978-1-603095-09-9",
    isbn_10: "1-603-09509-8",
    price: 701.00,
    publication_year: 2022,
    edition: "Book 1",
    cover_url: "The Bend of Luck.png",
    publisher: publishers[4] # Top Shelf Productions
  },
  {
    title: "The Underwater Welder",
    isbn_13: "978-1-603090-74-2",
    isbn_10: "1-603-09074-6",
    price: 4170.00,
    publication_year: 2012,
    edition: "Book 1",
    cover_url:  "The Underwater Welder.png",
    publisher: publishers[4] # Top Shelf Productions
  },
  {
    title: "American Elf",
    isbn_13: "978-1-891830-85-3",
    isbn_10: "1-891-83085-6",
    price: 1000.00,
    publication_year: 2004,
    edition: "Book 2",
    publisher: publishers[0] # Paste Magazine
  },
  {
    title: "Cosmoknights",
    isbn_13: "978-1-60309-454-2",
    isbn_10: "1-603-09454-7",
    price: 2000.00,
    publication_year: 2019,
    edition: "Book 1",
    publisher: publishers[1] # Publishers Weekly
  },
  {
    title: "Essex County",
    isbn_13: "978-1-60309-038-4",
    isbn_10: "1-603-09038-X",
    price: 500.00,
    publication_year: 1990,
    edition: nil,
    publisher: publishers[2] # Graywolf Press
  },
  {
    title: "Hey, Mister (Vol 1)",
    isbn_13: "978-1-891830-02-0",
    isbn_10: "1-891-83002-3",
    price: 1200.00,
    publication_year: 2000,
    edition: "After School Special",
    publisher: publishers[2] # Graywolf Press
  },
  {
    title: "The Underwater Welder",
    isbn_13: "978-1-60309-398-9",
    isbn_10: "1-603-09398-2",
    price: 3000.00,
    publication_year: 2022,
    edition: nil,
    publisher: publishers[3] # McSweeney's
  }
].map { |book| Book.find_or_create_by!(book) }

# AuthorBooks (Associating authors with books)
AuthorBook.find_or_create_by!(author: authors[7], book: books[0]) # Balazs Balazs - Doughnuts & Doom

AuthorBook.find_or_create_by!(author: authors[8], book: books[1]) # Peter Hoey - The Bend of Luck
AuthorBook.find_or_create_by!(author: authors[9], book: books[1]) # Maria Hoey - The Bend of Luck

AuthorBook.find_or_create_by!(author: authors[10], book: books[2]) # Jeff Lemire - The Underwater Welder

AuthorBook.find_or_create_by!(author: authors[0], book: books[3]) # Joel Hartse - American Elf
AuthorBook.find_or_create_by!(author: authors[1], book: books[3]) # Hannah Templer - American Elf
AuthorBook.find_or_create_by!(author: authors[2], book: books[3]) # Marguerite Duras - American Elf

AuthorBook.find_or_create_by!(author: authors[3], book: books[4]) # Kingsley Amis - Cosmoknights
AuthorBook.find_or_create_by!(author: authors[3], book: books[5]) # Kingsley Amis - Essex County

AuthorBook.find_or_create_by!(author: authors[1], book: books[6]) # Hannah Templer - Hey, Mister (Vol 1)
AuthorBook.find_or_create_by!(author: authors[4], book: books[6]) # Fannie Flagg - Hey, Mister (Vol 1)
AuthorBook.find_or_create_by!(author: authors[5], book: books[6]) # Camille Paglia - Hey, Mister (Vol 1)

AuthorBook.find_or_create_by!(author: authors[6], book: books[7]) # Rainer Rilke - The Underwater Welder