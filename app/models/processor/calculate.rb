# frozen_string_literal: true

module Processor
  class Calculate
    def level1(interval = nil)
      inputs = Input.where(level: 1).order(:order)
      Level1.new(inputs.pluck(:input)).calc_total(interval)
    end

    def level2(stage)
      input_array = [[]]
      inputs = Input.where(level: 2).order(:line)
      inputs.each do |input|
        input_array[input[:line]] = [] unless input_array[input[:line]]
        input_array[input[:line]].push(input[:input])
      end

      case stage
        when 1 then Level2.new(input_array).checksum
        when 2 then Level2.new(input_array).checksum_abs_divides
      end
    end
  end
end
