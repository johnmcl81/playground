# frozen_string_literal: true

module Processor
  module Interfaces
    module Level1
      class Input
        def load
          Inputs::Input.where(type: "Inputs::Level1").order(:order).pluck(:input)
        end
      end
    end
  end
end
