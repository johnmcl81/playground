# frozen_string_literal: true

module Processor
  module Interfaces
    class CalculateResult
      def result
        Result.result.calculate
      end
    end
  end
end
