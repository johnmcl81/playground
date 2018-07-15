# frozen_string_literal: true

module Processor
  class Level

    def initialize(level, stage)
      @level = level
      @stage = stage
      @input = Interfaces::LoadInput.new(level).input
    end

    def result
      Interfaces::CalculateResult.new(input, level, stage).result
    end

    attr_accessor :input, :level, :stage
  end
end
