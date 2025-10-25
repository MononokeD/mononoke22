json.authors do
  json.array! @authors do |author|
    json.id author.id
    json.name author.name
    json.bio author.bio
    json.active author.active
    json.books_count author.books.count
    json.created_at author.created_at
    json.updated_at author.updated_at
  end
end

json.pagination @pagination
