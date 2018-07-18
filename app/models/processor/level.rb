# frozen_string_literal: true

module Processor
  class Level

    def initialize(level, stage)
      @level = level
      @stage = stage
    end

    def result
      Interfaces::CalculateResult.new(input, level, stage).result
    end

    attr_accessor :level, :stage

    def input
      Interfaces::LoadInput.new(level).input
    end
  end
end
