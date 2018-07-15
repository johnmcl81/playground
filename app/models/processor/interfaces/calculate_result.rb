# frozen_string_literal: true

module Processor
  module Interfaces
    class CalculateResult

      def initialize(input, level, stage)
        @input = input
        @level = level
        @stage = stage
      end

      def result
        case level
        when 1 then Level1::Result.new(input, stage).calculate
        when 2 then Level2::Result.new(input, stage).calculate
        end
      end

      private

      attr_reader :input, :level, :stage
    end
  end
end
