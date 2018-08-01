# frozen_string_literal: true

module Processor
  module Interfaces
    module Level3
      class Result
        def initialize(input, stage)
          @input = input
          @stage = stage
          @location = { step: 1, position: [0, 0], orientation: :east }
          @spiral = [@location[:position]]
        end

        def calculate
          case stage
          when 1 then find_shortest_path
          end
        end

        private

        def find_shortest_path
          build_spiral
          coords(:x).abs + coords(:y).abs
        end

        def build_spiral
          loop do
            break unless location[:step] < input
            step
            location[:step] += 1
            puts location[:step]
          end
          location[:step]
        end

        def step
          location[:position] = next_coords(location[:orientation])
          spiral << location[:position]
          unless turn_blocked?
            turn
          end
        end

        def turn
          location[:orientation] = turn_change(location[:orientation])
        end

        def turn_blocked?
          location[:orientation]
            .yield_self { |orientation| turn_change(orientation) }
            .yield_self { |turn_changes| next_coords(turn_changes) }
            .yield_self { |next_coord| spiral.include?(next_coord) }
        end

        def turn_change(key)
          case key
          when :north then :west
          when :east then :north
          when :south then :east
          when :west then :south
          end
        end

        def next_coords(orientation)
          x = coords(:x) + coords_change(:x, orientation)
          y = coords(:y) + coords_change(:y, orientation)
          [x, y]
        end

        def coords(axis)
          location[:position][coord_index(axis)]
        end

        def coords_change(axis, orientation)
          coord_offset(orientation)[coord_index(axis)]
        end

        def coord_offset(key)
          case key
          when :north then [0, 1]
          when :east then [1, 0]
          when :south then [0, -1]
          when :west then [-1, 0]
          end
        end

        def coord_index(axis)
          case axis
          when :x then 0
          when :y then 1
          end
        end

        attr_reader :input, :stage, :location, :spiral
      end
    end
  end
end
