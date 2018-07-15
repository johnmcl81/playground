require 'test_helper'

module Processor
  class LevelTest < Minitest::Test
    def test_level_1_results
      assert_equal 1049, Level.new(1, 1).result
      assert_equal 1508, Level.new(1, 2).result
    end

    def test_level_2_results
      assert_equal 48357, Level.new(2, 1).result
      assert_equal 351, Level.new(2, 2).result
    end
  end
end