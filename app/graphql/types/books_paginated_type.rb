module Types
  class BooksPaginatedType < Types::BaseObject
    field :books, [Types::BookType], null: false
    field :total_count, Integer, null: false
    field :current_page, Integer, null: false
    field :per_page, Integer, null: false
    field :total_pages, Integer, null: false
    field :has_next_page, Boolean, null: false
    field :has_previous_page, Boolean, null: false
  end
end