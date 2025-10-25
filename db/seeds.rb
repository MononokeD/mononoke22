puts "Clearing existing data..."
Book.destroy_all
Author.destroy_all

puts "\n" + "="*50
puts "Creating Authors..."
puts "="*50

# Створення авторів
authors_data = [
  {
    name: "Matt Haig",
    bio: "Matt Haig is an English novelist and journalist known for his works of fiction and non-fiction exploring mental health and the human experience.",
    active: true
  },
  {
    name: "Andy Weir",
    bio: "Andy Weir is an American novelist best known for his science fiction works 'The Martian' and 'Project Hail Mary'.",
    active: true
  },
  {
    name: "Madeline Miller",
    bio: "Madeline Miller is an American author known for her mythological retellings 'The Song of Achilles' and 'Circe'.",
    active: true
  },
  {
    name: "Tara Westover",
    bio: "Tara Westover is an American memoirist, essayist, and historian best known for her book 'Educated'.",
    active: false # Неактивний автор
  },
  {
    name: "James Clear",
    bio: "James Clear is an American author and speaker focused on habits, decision making, and continuous improvement.",
    active: true
  },
  {
    name: "Alex Michaelides",
    bio: "Alex Michaelides is a British-Cypriot author and screenwriter, known for his psychological thriller 'The Silent Patient'.",
    active: true
  },
  {
    name: "Taylor Jenkins Reid",
    bio: "Taylor Jenkins Reid is an American author known for her novels about fame, love, and identity.",
    active: true
  },
  {
    name: "Frank Herbert",
    bio: "Frank Herbert was an American science-fiction author best known for the novel 'Dune' and its sequels.",
    active: false # Неактивний автор
  }
]

authors = authors_data.map do |author_data|
  author = Author.create!(author_data)
  status = author.active ? "✓ Active" : "✗ Inactive"
  puts "#{status} - Created author: #{author.name}"
  author
end

puts "\n" + "="*50
puts "Creating Books..."
puts "="*50

# Книги для Matt Haig
Book.create!([
  {
    title: "The Midnight Library",
    author: authors[0],
    year: 2020,
    description: "A story about choices, regrets, and all the lives we could have lived — between life and death."
  }
])
puts "  → Created 1 book for #{authors[0].name}"

# Книги для Andy Weir
Book.create!([
  {
    title: "Project Hail Mary",
    author: authors[1],
    year: 2021,
    description: "A lone astronaut must save humanity in this thrilling blend of science fiction and survival."
  },
  {
    title: "The Martian",
    author: authors[1],
    year: 2014,
    description: "An astronaut stranded on Mars must use his ingenuity to survive until rescue."
  }
])
puts "  → Created 2 books for #{authors[1].name}"

# Книги для Madeline Miller
Book.create!([
  {
    title: "The Song of Achilles",
    author: authors[2],
    year: 2011,
    description: "A retelling of the Iliad through the love story of Achilles and Patroclus."
  },
  {
    title: "Circe",
    author: authors[2],
    year: 2018,
    description: "A reimagining of the life of the Greek goddess Circe — witch, exile, and heroine."
  }
])
puts "  → Created 2 books for #{authors[2].name}"

# Не створюємо книги для неактивного автора (Tara Westover)
puts "  → Skipped books for #{authors[3].name} (inactive author)"

# Книги для James Clear
Book.create!([
  {
    title: "Atomic Habits",
    author: authors[4],
    year: 2018,
    description: "A practical guide on how small habits can lead to remarkable changes in your life."
  }
])
puts "  → Created 1 book for #{authors[4].name}"

# Книги для Alex Michaelides
Book.create!([
  {
    title: "The Silent Patient",
    author: authors[5],
    year: 2019,
    description: "A psychological thriller about a woman’s act of violence and the therapist obsessed with uncovering her motive."
  }
])
puts "  → Created 1 book for #{authors[5].name}"

# Книги для Taylor Jenkins Reid
Book.create!([
  {
    title: "The Seven Husbands of Evelyn Hugo",
    author: authors[6],
    year: 2017,
    description: "A reclusive Hollywood icon recounts her glamorous and scandalous life to a young journalist."
  }
])
puts "  → Created 1 book for #{authors[6].name}"

# Не створюємо книги для неактивного автора (Frank Herbert)
puts "  → Skipped books for #{authors[7].name} (inactive author)"

# Книга без автора (для тестування optional: true)
Book.create!([
  {
    title: "Unknown Masterpiece",
    author: nil,
    year: 2020,
    description: "A mysterious book with no known author."
  }
])
puts "  → Created 1 book without author"

puts "\n" + "="*50
puts "Summary:"
puts "="*50
puts "📚 Total Authors: #{Author.count} (#{Author.active.count} active, #{Author.where(active: false).count} inactive)"
puts "📖 Total Books: #{Book.count}"
puts "✓ Active authors with books: #{Author.active.joins(:books).distinct.count}"
puts "="*50
puts "\n🎉 Seeds completed successfully!"
