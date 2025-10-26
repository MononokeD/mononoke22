# frozen_string_literal: true

module Mutations
  class CreateBook < BaseMutation
    description "Creates a new book"

    # Вхідні поля
    argument :title, String, required: true
    argument :author_id, ID, required: false
    argument :year, Integer, required: true
    argument :description, String, required: false

    # Вихідні поля
    field :book, Types::BookType, null: true
    field :errors, [String], null: false

    def resolve(title:, year:, author_id: nil, description: nil)
      book = Book.new(
        title: title,
        year: year,
        description: description
      )
      
      # Додавання автора, якщо вказано
      if author_id.present?
        author = Author.find_by(id: author_id)
        if author
          book.author = author
        else
          return {
            book: nil,
            errors: ["Author with ID #{author_id} not found"]
          }
        end
      end

      if book.save
        {
          book: book,
          errors: []
        }
      else
        {
          book: nil,
          errors: book.errors.full_messages
        }
      end
    end
  end
end
