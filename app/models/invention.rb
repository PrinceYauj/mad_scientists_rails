class Invention < ApplicationRecord
  belongs_to :scientist
  validates :power, numericality: { greater_than: 0 }
  validates :name, presence: true
  validates :name, length: { maximum: 255 }
end