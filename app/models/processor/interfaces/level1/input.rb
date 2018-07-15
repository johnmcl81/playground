# frozen_string_literal: true

module Processor
  module Interfaces
    module Level1
      class Input
        def load
          ::Input.where(level: 1).order(:order).pluck(:input)
        end
      end
    end
  end
end
