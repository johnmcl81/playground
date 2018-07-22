# frozen_string_literal: true

class Result < ApplicationRecord
  validates :level, presence: true
  validates :stage, presence: true
  validates :type, presence: true

  def calculate
    raise NotImplementedError
  end
end

class ResultLevel1 < Result
  def calculate
    Processor::Interfaces::Level1::Result.new(input, stage).calculate
  end

  private

  def input
    Processor::Interfaces::Level1::Input.new.load
  end
end

class ResultLevel2 < Result
  def calculate
    Processor::Interfaces::Level2::Result.new(input, stage).calculate
  end

  private

  def input
    Processor::Interfaces::Level2::Input.new.load
  end
end
