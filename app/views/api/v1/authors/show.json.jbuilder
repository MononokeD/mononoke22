json.author do
  json.id @author.id
  json.name @author.name
  json.bio @author.bio
  json.active @author.active
  json.created_at @author.created_at
  json.updated_at @author.updated_at
  
  json.books do
    json.array! @author.books do |book|
      json.id book.id
      json.title book.title
      json.year book.year
      json.description book.description
    end
  end
  
  json.books_count @author.books.count
end