# Clear existing data in the correct order
Borrowing.destroy_all  # Borrowings reference users & books, so delete them first
User.destroy_all
Book.destroy_all

# Reset primary key sequence for SQLite (optional, but prevents ID conflicts)
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='users'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='books'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='borrowings'")

# Create Users
users = []
10.times do |i|
  users << User.create!(email: "user#{i + 1}@example.com", password: "password123")
end

puts "Created #{User.count} users."

# Create Books
books = [
  { title: "Ruby on Rails Tutorial", author: "Michael Hartl", isbn: "9780136702658" },
  { title: "Clean Code", author: "Robert C. Martin", isbn: "9780132350884" },
  { title: "The Pragmatic Programmer", author: "Andrew Hunt, David Thomas", isbn: "9780201616224" },
  { title: "Design Patterns", author: "Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides", isbn: "9780201633610" },
  { title: "Eloquent JavaScript", author: "Marijn Haverbeke", isbn: "9781593279509" },
  { title: "You Don't Know JS", author: "Kyle Simpson", isbn: "9781491904244" },
  { title: "JavaScript: The Good Parts", author: "Douglas Crockford", isbn: "9780596517748" },
  { title: "The Art of Computer Programming", author: "Donald Knuth", isbn: "9780201896831" },
  { title: "Introduction to the Theory of Computation", author: "Michael Sipser", isbn: "9781133187790" },
  { title: "Operating System Concepts", author: "Abraham Silberschatz", isbn: "9781118063330" },
  { title: "Artificial Intelligence: A Modern Approach", author: "Stuart Russell, Peter Norvig", isbn: "9780134610993" },
  { title: "Deep Learning", author: "Ian Goodfellow, Yoshua Bengio, Aaron Courville", isbn: "9780262035613" },
  { title: "Machine Learning Yearning", author: "Andrew Ng", isbn: "9781999579500" },
  { title: "Computer Networking: A Top-Down Approach", author: "James Kurose, Keith Ross", isbn: "9780133594140" },
  { title: "The C Programming Language", author: "Brian Kernighan, Dennis Ritchie", isbn: "9780131103627" },
  { title: "Python Crash Course", author: "Eric Matthes", isbn: "9781593279288" },
  { title: "Fluent Python", author: "Luciano Ramalho", isbn: "9781491946008" },
  { title: "Automate the Boring Stuff with Python", author: "Al Sweigart", isbn: "9781593275990" },
  { title: "Effective Java", author: "Joshua Bloch", isbn: "9780134685991" },
  { title: "Java Concurrency in Practice", author: "Brian Goetz", isbn: "9780321349606" },
  { title: "Head First Design Patterns", author: "Eric Freeman, Elisabeth Robson", isbn: "9780596007126" },
  { title: "Refactoring", author: "Martin Fowler", isbn: "9780134757599" },
  { title: "The Mythical Man-Month", author: "Frederick P. Brooks Jr.", isbn: "9780201835953" },
  { title: "Code Complete", author: "Steve McConnell", isbn: "9780735619678" },
  { title: "Working Effectively with Legacy Code", author: "Michael Feathers", isbn: "9780131177055" },
  { title: "Structure and Interpretation of Computer Programs", author: "Harold Abelson, Gerald Jay Sussman", isbn: "9780262510875" },
  { title: "Introduction to Algorithms", author: "Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein", isbn: "9780262033848" },
  { title: "The Elements of Statistical Learning", author: "Trevor Hastie, Robert Tibshirani, Jerome Friedman", isbn: "9780387848570" },
  { title: "Compilers: Principles, Techniques, and Tools", author: "Alfred V. Aho, Monica S. Lam, Ravi Sethi, Jeffrey D. Ullman", isbn: "9780321486813" }
]

books.each { |book| Book.create!(book) }

puts "Created #{Book.count} books."

# Create Borrowings (Assigning random books to random users)
5.times do
  Borrowing.create!(
    user: users.sample,
    book: Book.all.sample,
    due_date: 2.weeks.from_now
  )
end

puts "Created #{Borrowing.count} borrowings."
