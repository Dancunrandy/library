# Book Lending Library

A simple book lending library application built with Ruby on Rails 8.

## Features
- User registration and login using Rails' default authentication.
- Browse available books.
- Borrow and return books.
- View currently borrowed books on the user profile page.

## Setup
1. . Clone the repository:
   ```bash
   git clone https://github.com/Dancunrandy/library
   cd library
2. Run `bundle install`.
3. Run `bundle add tailwindcss-rails`,
       `rails tailwindcss:install`.

4. Run `rails db:migrate`.
5. Run `rails db:seed`
6. Start the server with `rails server`. and 
7. Visit  http://127.0.0.1:3000 in your browser.


## Running Tests
Run `rails test` to execute all tests.