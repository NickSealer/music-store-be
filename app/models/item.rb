class Item < ApplicationRecord
  acts_as_paranoid

  COLORS = %w[red black white purple green orange yellow silver brown blue gold]

  enum category: { undefined: 0, string: 1, wind: 2, percussion: 3 }
  enum status: { discontinued: 0, available: 1, unavailable: 2, paused: 3 }

  validates_presence_of :name, :description, :color
  validates :name, length: { minimum: 3, maximum: 50 }
  validates :description, length: { minimum: 3, maximum: 500 }

  scope :active, -> { where.not(status: [0]) }
end
