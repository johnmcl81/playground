require 'open-uri'

Input.delete_all
File.open(File.join(Rails.root, 'app', 'data', 'level_1_input.txt')) do |input|
  full_input = input.read
  input_array = full_input.split('')
  input_array.each_with_index do |int, index|
    Input.create!(input: int, order: index, level: 1)
  end
end
