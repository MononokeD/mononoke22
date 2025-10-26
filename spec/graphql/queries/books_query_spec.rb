require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'books query' do
    let!(:author) { create(:author, name: 'Test Author') }
    let!(:books) { create_list(:book, 3, author: author) }
    
    let(:query) do
      <<~GQL
        query {
          books {
            id
            title
            year
            author {
              name
            }
          }
        }
      GQL
    end

    it 'returns all books' do
      result = BookshelfSchema.execute(query)
      
      expect(result.dig('data', 'books').length).to eq(3)
      expect(result.dig('data', 'books', 0, 'author', 'name')).to eq('Test Author')
    end
  end

  describe 'book query' do
    let!(:book) { create(:book, title: 'Test Book', year: 2024) }
    
    let(:query) do
      <<~GQL
        query($id: ID!) {
          book(id: $id) {
            id
            title
            year
          }
        }
      GQL
    end

    it 'returns a specific book' do
      result = BookshelfSchema.execute(query, variables: { id: book.id.to_s })
      
      expect(result.dig('data', 'book', 'title')).to eq('Test Book')
      expect(result.dig('data', 'book', 'year')).to eq(2024)
    end
  end
end