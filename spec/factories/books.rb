# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  author      :string
#  description :text
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :bigint
#
# Indexes
#
#  index_books_on_author_id  (author_id)
#
FactoryBot.define do
  factory :book do
    title { "MyString" }
    author { "MyString" }
    year { 1 }
    description { "MyText" }
  end
end
