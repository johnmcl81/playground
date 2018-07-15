# frozen_string_literal: true

module Processor
  module Interfaces
    class LoadInput

      def initialize(level)
        @level = level
      end

      def input
        case level
          when 1 then Level1::Input.new.load
          when 2 then Level2::Input.new.load
        end
      end

      private

      attr_reader :level
    end
  end
end
