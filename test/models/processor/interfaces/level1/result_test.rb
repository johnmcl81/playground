require 'test_helper'

module Processor
  module Interfaces
    module Level1
      class ResultTest < Minitest::Test
        def test_stage_1_interval_of_1
          assert_equal 3, Result.new(input_array(1122), 1).calculate
          assert_equal 4, Result.new(input_array(1111), 1).calculate
          assert_equal 0, Result.new(input_array(1234), 1).calculate
          assert_equal 9, Result.new(input_array(91212129), 1).calculate
        end

        def test_stage_2_interval_auto
          assert_equal 6, Result.new(input_array(1212), 2).calculate
          assert_equal 0, Result.new(input_array(1221), 2).calculate
          assert_equal 4, Result.new(input_array(123425), 2).calculate
          assert_equal 12, Result.new(input_array(123123), 2).calculate
          assert_equal 4, Result.new(input_array(12131415), 2).calculate
        end

        private

        def input_array(integer)
          integer.to_s.scan(/\d/).map { |i| i.to_i }
        end
      end
    end
  end
end