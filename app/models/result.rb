# frozen_string_literal: true

class Result < ApplicationRecord
  validates :level, presence: true
  validates :stage, presence: true
  validates :result, presence: true
end
