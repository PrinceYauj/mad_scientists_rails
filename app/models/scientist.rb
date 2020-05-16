class Scientist < ApplicationRecord
  has_many :inventions
  validates :madness, :attempts, numericality: { greater_than: 0 }
end
