module Types
  class BookConnectionType < Types::BaseObject
    field :nodes, [Types::BookType], null: false
    field :total_count, Integer, null: false
    field :page_info, Types::PageInfoType, null: false
  end
end