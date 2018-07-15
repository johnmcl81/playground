require 'test_helper'

module Processor
  module Interfaces
    module Level2
      class ResultTest < Minitest::Test
        def test_stage_1
          assert_equal 18, Result.new(input_array_1, 1).calculate
        end

        def test_stage_2
          assert_equal 9, Result.new(input_array_2, 2).calculate
        end

        private

        def input_array_1
          array = []
          array << 5195.to_s.scan(/\d/).map(&:to_i)
          array << 753.to_s.scan(/\d/).map(&:to_i)
          array << 2468.to_s.scan(/\d/).map(&:to_i)
        end

        def input_array_2
          array = []
          array << 5928.to_s.scan(/\d/).map(&:to_i)
          array << 9473.to_s.scan(/\d/).map(&:to_i)
          array << 3865.to_s.scan(/\d/).map(&:to_i)
        end
      end
    end
  end
end