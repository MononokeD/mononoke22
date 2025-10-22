class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :year, presence: true, 
                   numericality: { only_integer: true, 
                                   greater_than_or_equal_to: 1900, 
                                   less_than_or_equal_to: 2030 }
end