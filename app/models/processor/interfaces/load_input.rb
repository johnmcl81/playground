# frozen_string_literal: true

module Processor
  module Interfaces
    class LoadInput
      def input
        Input.input.load
      end
    end
  end
end
