Book.destroy_all

# Створення тестових книг
books = [
  {
    title: "The Midnight Library",
    author: "Matt Haig",
    year: 2020,
    description: "A story about choices, regrets, and all the lives we could have lived — between life and death."
  },
  {
    title: "Project Hail Mary",
    author: "Andy Weir",
    year: 2021,
    description: "A lone astronaut must save humanity in this thrilling blend of science fiction and survival."
  },
  {
    title: "The Song of Achilles",
    author: "Madeline Miller",
    year: 2011,
    description: "A retelling of the Iliad through the love story of Achilles and Patroclus."
  },
  {
    title: "Educated",
    author: "Tara Westover",
    year: 2018,
    description: "A memoir of a woman who escapes her survivalist family to earn a PhD at Cambridge University."
  },
  {
    title: "The Martian",
    author: "Andy Weir",
    year: 2014,
    description: "An astronaut stranded on Mars must use his ingenuity to survive until rescue."
  },
  {
    title: "Circe",
    author: "Madeline Miller",
    year: 2018,
    description: "A reimagining of the life of the Greek goddess Circe — witch, exile, and heroine."
  },
  {
    title: "Atomic Habits",
    author: "James Clear",
    year: 2018,
    description: "A practical guide on how small habits can lead to remarkable changes in your life."
  },
  {
    title: "The Silent Patient",
    author: "Alex Michaelides",
    year: 2019,
    description: "A psychological thriller about a woman’s act of violence and the therapist obsessed with uncovering her motive."
  },
  {
    title: "The Seven Husbands of Evelyn Hugo",
    author: "Taylor Jenkins Reid",
    year: 2017,
    description: "A reclusive Hollywood icon recounts her glamorous and scandalous life to a young journalist."
  },
  {
    title: "Dune",
    author: "Frank Herbert",
    year: 1965,
    description: "An epic science fiction saga of politics, prophecy, and power set on the desert planet Arrakis."
  }
]

books.each do |book_data|
  Book.create!(book_data)
  puts "Created: #{book_data[:title]}"
end

puts "\n#{Book.count} books created successfully!"
