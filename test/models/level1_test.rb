require 'test_helper'

class Level1Test < ActiveSupport::TestCase
  test "input set to 1122 and interval of 1" do
    test_level = Level1.new
    test_level.input = 1122
    assert_equal 3, test_level.calc_total(1)
  end

  test "input set to 1111 and interval of 1" do
    test_level = Level1.new
    test_level.input = 1111
    assert_equal 4, test_level.calc_total(1)
  end

  test "input set to 1234 and interval of 1" do
    test_level = Level1.new
    test_level.input = 1234
    assert_equal 0, test_level.calc_total(1)
  end

  test "input set to 91212129 and interval of 1" do
    test_level = Level1.new
    test_level.input = 91212129
    assert_equal 9, test_level.calc_total(1)
  end

  test "input set to 1212 and interval auto" do
    test_level = Level1.new
    test_level.input = 1212
    assert_equal 6, test_level.calc_total
  end

  test "input set to 1221 and interval auto" do
    test_level = Level1.new
    test_level.input = 1221
    assert_equal 0, test_level.calc_total
  end

  test "input set to 123425 and interval auto" do
    test_level = Level1.new
    test_level.input = 123425
    assert_equal 4, test_level.calc_total
  end

  test "input set to 123123 and interval auto" do
    test_level = Level1.new
    test_level.input = 123123
    assert_equal 12, test_level.calc_total
  end

  test "input set to 12131415 and interval auto" do
    test_level = Level1.new
    test_level.input = 12131415
    assert_equal 4, test_level.calc_total
  end

end
