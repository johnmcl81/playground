class Input < ApplicationRecord
  validates :input, presence: true
  validates :order, presence: true
  validates :line, presence: true
  validates :level, presence: true
end
