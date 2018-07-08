# frozen_string_literal: true

module Processor
  class Level1 < Calculate

    def initialize(input_array)
      @int_arry = input_array
    end

    def calc_total(interval = nil)
      total = 0
      interval = @int_arry.size / 2 if interval.nil?
      @int_arry.each_with_index do |int, index|
        interval_offset = index - interval
        match_index = interval_offset.negative? ? interval_offset + @int_arry.size : interval_offset
        if @int_arry[match_index] == @int_arry[index]
          total += int
        end
      end
      total
    end

  end
end
