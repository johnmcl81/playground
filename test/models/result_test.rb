require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  def test_level_1_results
    assert_equal 1049, Result.new(level: 1, stage: 1, type: "ResultLevel1").calculate
    assert_equal 1508, Result.new(level: 1, stage: 2, type: "ResultLevel1").calculate
  end

  def test_level_2_results
    assert_equal 48357, Result.new(level: 2, stage: 1, type: "ResultLevel2").calculate
    assert_equal 351, Result.new(level: 2, stage: 2, type: "ResultLevel2").calculate
  end
end
