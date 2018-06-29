# frozen_string_literal: true

class Level1 < ApplicationRecord

  validates :input, presence: true

  def calc_total(interval = nil)
    total = 0
    interval = int_array.size / 2 if interval.nil?
    int_array.each_with_index do |int, index|
      interval_offset = index - interval
      match_index = interval_offset.negative? ? interval_offset + int_array.size : interval_offset
      if int_array[match_index] == int_array[index]
        total += int
      end
    end
    total
  end

  def parse_input(filename)
    file = File.join(Rails.root, 'app', 'data', filename)
    File.read(file).to_s
  end

  private

  attr_accessor :int_array

  def int_array
    @int_array = input.scan(/\d/).map { |i| i.to_i }
  end

end
