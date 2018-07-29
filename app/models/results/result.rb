# frozen_string_literal: true
module Results
  class Result < ApplicationRecord
    validates :stage, presence: true
    validates :type, presence: true

    def calculate
      raise NotImplementedError
    end
  end

  class Level1 < Result
    def calculate
      Processor::Interfaces::Level1::Result.new(input, stage).calculate
    end

    private

    def input
      Processor::Interfaces::Level1::Input.new.load
    end
  end

  class Level2 < Result
    def calculate
      Processor::Interfaces::Level2::Result.new(input, stage).calculate
    end

    private

    def input
      Processor::Interfaces::Level2::Input.new.load
    end
  end

  class Level3 < Result
    def calculate
      Processor::Interfaces::Level3::Result.new(input, stage).calculate
    end

    private

    def input
      Processor::Interfaces::Level3::Input.new.load
    end
  end
end
