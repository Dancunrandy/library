class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :due_date, presence: true

  def return_book
    update(returned_at: Time.current)
  end
end