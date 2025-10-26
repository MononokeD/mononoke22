# frozen_string_literal: true

module Mutations
  class CreateAuthor < BaseMutation
    description "Creates a new author"

    argument :name, String, required: true
    argument :bio, String, required: false
    argument :active, Boolean, required: false

    field :author, Types::AuthorType, null: true
    field :errors, [String], null: false

    def resolve(name:, bio: nil, active: true)
      author = Author.new(
        name: name,
        bio: bio,
        active: active
      )

      if author.save
        {
          author: author,
          errors: []
        }
      else
        {
          author: nil,
          errors: author.errors.full_messages
        }
      end
    end
  end
end
