# frozen_string_literal: true

module Processor
  module Interfaces
    module Level1
      class Result
        def initialize(input, stage)
          @input = input
          @interval = stage == 2 ? input.size / 2 : 1
        end

        def calculate
          total = 0
          input.each_with_index do |int, index|
            interval_offset = index - interval
            match_index = interval_offset.negative? ? interval_offset + input.size : interval_offset
            if input[match_index] == input[index]
              total += int
            end
          end
          total
        end

        private

        attr_reader :input, :interval
      end
    end
  end
end
