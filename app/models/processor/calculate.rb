# frozen_string_literal: true

module Processor
  class Calculate
    def level1(interval = nil)
      inputs = Input.where(level: 1).order(:order)
      Level1.new(inputs.pluck(:input)).calc_total(interval)
    end
  end
end
