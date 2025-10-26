# frozen_string_literal: true

module Types
  class AuthorType < Types::BaseObject
    description "An author of books"
    
    field :id, ID, null: false
    field :name, String, null: false
    field :bio, String, null: true
    field :active, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    
    # Зв'язок з книгами
    field :books, [Types::BookType], null: false
    field :books_count, Integer, null: false
    
    # Метод для підрахунку книг
    def books_count
      object.books.count
    end
  end
end
