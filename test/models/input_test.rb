require 'test_helper'

class InputTest < ActiveSupport::TestCase
  test "level 1 input is valid" do
    input_string = File.open(File.join(Rails.root, 'app', 'data', 'level_1_input.txt')).read

    assert_equal input_string, Input.where(level: 1).order(:order).pluck(:input).join('')
  end

  test "level 2 input is valid" do
    input_lines = File.open(File.join(Rails.root, 'app', 'data', 'level_2_input.txt')).readlines
    input_lines.each_with_index do |line, index|
      assert_equal line, Input.where(level: 2, line: index).pluck(:input).join("\t") + "\n"
    end
  end
end
