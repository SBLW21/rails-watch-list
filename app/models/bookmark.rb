class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, presence: true
  validates_length_of :comment, minimum: 6
  validates_uniqueness_of :movie_id, scope: [:list_id]

  # validates :comment, length: { minimum: 6 }
  # validates :movie_id, uniqueness: { scope: :list_id, message: "is already in the list" }
end
