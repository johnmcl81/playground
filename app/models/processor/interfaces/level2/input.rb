# frozen_string_literal: true

module Processor
  module Interfaces
    module Level2
      class Input
        def load
          input_array = [[]]
          inputs = Inputs::Input.where(type: "Inputs::Level2").order(:line)
          inputs.each do |input|
            input_array[input[:line]] = [] unless input_array[input[:line]]
            input_array[input[:line]].push(input[:input])
          end
          input_array
        end
      end
    end
  end
end
