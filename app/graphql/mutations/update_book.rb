# frozen_string_literal: true

module Mutations
  class UpdateBook < BaseMutation
    description "Updates an existing book"

    argument :id, ID, required: true
    argument :title, String, required: false
    argument :author_id, ID, required: false
    argument :year, Integer, required: false
    argument :description, String, required: false

    field :book, Types::BookType, null: true
    field :errors, [String], null: false

    def resolve(id:, **attributes)
      book = Book.find_by(id: id)

      unless book
        return {
          book: nil,
          errors: ["Book with ID #{id} not found"]
        }
      end

      # Оновлення автора, якщо вказано
      if attributes[:author_id].present?
        author = Author.find_by(id: attributes[:author_id])
        unless author
          return {
            book: nil,
            errors: ["Author with ID #{attributes[:author_id]} not found"]
          }
        end
        attributes[:author] = author
        attributes.delete(:author_id)
      end

      if book.update(attributes)
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
