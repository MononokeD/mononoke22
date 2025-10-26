require 'rails_helper'

RSpec.describe Mutations::CreateBook do
  describe 'createBook mutation' do
    let!(:author) { create(:author) }
    
    let(:mutation) do
      <<~GQL
        mutation($title: String!, $authorId: ID, $year: Int!, $description: String) {
          createBook(input: {
            title: $title
            authorId: $authorId
            year: $year
            description: $description
          }) {
            book {
              id
              title
              year
              author {
                name
              }
            }
            errors
          }
        }
      GQL
    end

    it 'creates a book' do
      variables = {
        title: 'New Book',
        authorId: author.id.to_s,
        year: 2024,
        description: 'Test description'
      }

      expect {
        BookshelfSchema.execute(mutation, variables: variables)
      }.to change(Book, :count).by(1)
    end

    it 'returns errors for invalid data' do
      variables = {
        title: '',
        year: 2024
      }

      result = BookshelfSchema.execute(mutation, variables: variables)
      
      expect(result.dig('data', 'createBook', 'book')).to be_nil
      expect(result.dig('data', 'createBook', 'errors')).to be_present
    end
  end
end