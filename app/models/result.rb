# frozen_string_literal: true

class Result < ApplicationRecord
  validates :level, presence: true
  validates :stage, presence: true
  validates :result, presence: true

  #:TODO Implement STI for both interface classes Result and Input
  def calculate
    raise NotImplementedError
  end
end


class ResultLevel2 < Result
  def calculate
    Level2::Result.new(input, stage).calculate
  end
end

class ResultLevel1 < Result
  def calculate
    Level1::Result.new(input, stage).calculate
  end
end
