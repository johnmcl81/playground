# frozen_string_literal: true

module Processor
  class Level2 < Calculate

    def initialize(input_array)
      @int_array = input_array
    end

    def checksum
      sum = 0
      @int_array.each do |row|
        sum += row.max - row.min
      end
      sum
    end

    def checksum_abs_divides
      sum = 0
      # TODO: make use of database fields like order to do this better
      @int_array.each do |row|
        row.sort!
        row.reverse!
        row.each_with_index do |int, index|
          (index..row.size - 2).each do |i|
            division = int.to_f / row[i + 1]
            sum += division.to_i if (division % 1).zero?
          end
        end
      end
      sum
    end

  end
end
