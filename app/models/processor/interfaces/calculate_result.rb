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
        result.calculate
      end

      private

      attr_reader :input, :level, :stage
    end
  end
end
