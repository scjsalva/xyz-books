json.title @book.title
json.isbn_13 @book.isbn_13
json.isbn_10 @book.isbn_10
json.price @book.price
json.cover_url @book.cover_url
json.publication_year @book.publication_year
json.edition @book.edition
json.authors do
  json.array! @book.authors do |author|
    json.name author.name
  end
end
json.publisher do
  json.name @book.publisher.name
end