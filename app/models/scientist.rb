# frozen_string_literal: true

class Scientist < ApplicationRecord
  has_many :inventions, dependent: :destroy
  validates :madness, :attempts, numericality: { greater_than: 0 }
end
