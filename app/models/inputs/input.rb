module Inputs
  class Input < ApplicationRecord
    validates :order, presence: true
    validates :line, presence: true
    validates :type, presence: true

    def load
      raise NotImplementedError
    end
  end

  class Level1 < Input
    def load
      Processor::Interfaces::Level1::Input.load
    end
  end

  class Level2 < Input
    def load
      Processor::Interfaces::Level2::Input.load
    end
  end
  
  class Level3 < Input
    def load
      Processor::Interfaces::Level3::Input.load
    end
  end
end
