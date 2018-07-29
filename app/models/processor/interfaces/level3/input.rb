# frozen_string_literal: true

module Processor
  module Interfaces
    module Level3
      class Input
        def load
          Inputs::Input.where(type: "Inputs::Level3").first.input
        end
      end
    end
  end
end
