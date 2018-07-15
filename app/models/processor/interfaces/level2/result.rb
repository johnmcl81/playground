# frozen_string_literal: true

module Processor
  module Interfaces
    module Level2
      class Result
        def initialize(input, stage)
          @input = input
          @stage = stage
        end

        def calculate
          case stage
            when 1 then checksum
            when 2 then checksum_abs_divides
          end
        end

        private

        def checksum
          sum = 0
          input.each do |row|
            sum += row.max - row.min
          end
          sum
        end

        def checksum_abs_divides
          sum = 0
          input.each do |row|
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

        attr_reader :input, :stage
      end
    end
  end
end
