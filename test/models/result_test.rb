require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  def test_level_1_results
    assert_equal 1049, Result.new(type: "Results::Level1", stage: 1).calculate
    assert_equal 1508, Result.new(type: "Results::Level1", stage: 2).calculate
  end

  def test_level_2_results
    assert_equal 48357, Result.new(type: "Results::Level2", stage: 1).calculate
    assert_equal 351, Result.new(type: "Results::Level2", stage: 2).calculate
  end
end
