require 'test_helper'

module Processor
  module Interfaces
    module Level3
      class ResultTest < Minitest::Test
        def test_stage_1
          assert_equal 0, Result.new(1, 1).calculate
          assert_equal 3, Result.new(12, 1).calculate
          assert_equal 2, Result.new(23, 1).calculate
          assert_equal 31, Result.new(1024, 1).calculate
          assert_equal 552, Result.new(325489, 1).calculate
        end

        def test_stage_2
          assert_equal 330785, Result.new(325489, 2).calculate
        end
      end
    end
  end
end