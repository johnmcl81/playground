Inputs::Input.delete_all
File.open(File.join(Rails.root, 'app', 'data', 'level_1_input.txt')) do |input|
  full_input = input.read
  input_array = full_input.split('')
  input_array.each_with_index do |int, index|
    Inputs::Input.create!(input: int, order: index, line: 1, level: 1, type: "Inputs::Level1")
  end
end

File.readlines(File.join(Rails.root, 'app', 'data', 'level_2_input.txt'))
    .each_with_index do |line, line_index|
  line.split(' ').map(&:to_i).each_with_index do |int, int_index|
    Inputs::Input.create!(input: int, order: int_index, line: line_index, level: 2, type: "Inputs::Level2")
  end
end

pp "finished!!"