require 'test_helper'

module Processor
  class Level1Test < Minitest::Test

    def test_stage_1_interval_of_1
      assert_equal 3, Level1.new(input_array(1122)).calc_total(1)
      assert_equal 4, Level1.new(input_array(1111)).calc_total(1)
      assert_equal 0, Level1.new(input_array(1234)).calc_total(1)
      assert_equal 9, Level1.new(input_array(91212129)).calc_total(1)
    end

    def test_stage_2_interval_auto
      assert_equal 6, Level1.new(input_array(1212)).calc_total
      assert_equal 0, Level1.new(input_array(1221)).calc_total
      assert_equal 4, Level1.new(input_array(123425)).calc_total
      assert_equal 12, Level1.new(input_array(123123)).calc_total
      assert_equal 4, Level1.new(input_array(12131415)).calc_total
    end

    private

    def input_array(integer)
      integer.to_s.scan(/\d/).map { |i| i.to_i }
    end
  end
end