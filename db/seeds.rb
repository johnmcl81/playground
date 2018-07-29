Inputs::Input.delete_all
File.readlines(File.join(Rails.root, 'app', 'data', 'level_2_input.txt'))
    .each_with_index do |line, line_index|
  line.split(' ').map(&:to_i).each_with_index do |int, int_index|
    Inputs::Input.create!(input: int, order: int_index, line: line_index, type: "Inputs::Level1")
  end
end

File.readlines(File.join(Rails.root, 'app', 'data', 'level_2_input.txt'))
    .each_with_index do |line, line_index|
  line.split(' ').map(&:to_i).each_with_index do |int, int_index|
    Inputs::Input.create!(input: int, order: int_index, line: line_index, type: "Inputs::Level2")
  end
end

line = File.read(File.join(Rails.root, 'app', 'data', 'level_3_input.txt'))
Inputs::Input.create!(input: line.to_i, order: 0, line: 0, type: "Inputs::Level3")

pp "finished!!"