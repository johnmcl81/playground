require 'test_helper'

module Processor
  class Level1Test < Minitest::Test

    def test_stage_1
      assert_equal 18, Level2.new(input_array_1).checksum
    end

    def test_stage_2
      assert_equal 9, Level2.new(input_array_2).checksum_abs_divides
    end

    private

    def input_array_1
      array = []
      array << 5195.to_s.scan(/\d/).map { |i| i.to_i }
      array << 753.to_s.scan(/\d/).map { |i| i.to_i }
      array << 2468.to_s.scan(/\d/).map { |i| i.to_i }
    end

    def input_array_2
      array = []
      array << 5928.to_s.scan(/\d/).map { |i| i.to_i }
      array << 9473.to_s.scan(/\d/).map { |i| i.to_i }
      array << 3865.to_s.scan(/\d/).map { |i| i.to_i }
    end

  end
end