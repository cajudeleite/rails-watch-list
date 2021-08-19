class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, presence: true
  validates :comment, length: { minimum: 6 }
  validates :list, uniqueness: { scope: [:movie_id] }
end
