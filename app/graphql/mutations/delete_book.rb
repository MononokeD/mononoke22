# frozen_string_literal: true

module Mutations
  class DeleteBook < BaseMutation
    description "Deletes a book"

    argument :id, ID, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false

    def resolve(id:)
      book = Book.find_by(id: id)

      unless book
        return {
          success: false,
          errors: ["Book with ID #{id} not found"]
        }
      end

      if book.destroy
        {
          success: true,
          errors: []
        }
      else
        {
          success: false,
          errors: book.errors.full_messages
        }
      end
    end
  end
end
