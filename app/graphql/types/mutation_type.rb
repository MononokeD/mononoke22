# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # Books
    field :create_book, mutation: Mutations::CreateBook
    field :update_book, mutation: Mutations::UpdateBook
    field :delete_book, mutation: Mutations::DeleteBook
    
    # Authors
    field :create_author, mutation: Mutations::CreateAuthor
  end
end
