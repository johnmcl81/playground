# frozen_string_literal: true

module Processor
  module Interfaces
    module Level3
      class Result
        def initialize(input, stage)
          @input = input
          @stage = stage
          @location = { step: 1, position: [0, 0], orientation: :east }
          @spiral = [{position: @location[:position], value: 1}]
          @state = {square: 1, leg: 0, x: 0, y: 0, leg_size: 1}
          @input_found = false
        end

        def calculate
          case stage
            when 1 then find_shortest_path
            when 2 then build_spiral
          end
        end

        private

        def find_shortest_path
          loop do
            if input_found?
              return state[:x].abs + state[:y].abs
            else
              if state[:leg] == 4
                state[:leg] = 0
              else
                state[:leg] += 1
              end
            end
            case state[:leg]
              when 1
                set_state(:x, 1)
              when 2
                set_state(:y, 1)
              when 3
                set_state(:x, -1)
              when 4
                set_state(:y, -1)
            end
          end
        end

        def set_state(coord, sign)
          state[:square] += state[:leg_size]
          state[coord] += state[:leg_size] * sign
          state[:leg_size] += 1 if state[:leg].even?
        end

        def input_found?
          if state[:square] >= input
            leg_offset = state[:square] - input
            case state[:leg]
              when 1
                state[:x] = state[:x] - leg_offset
              when 2
                state[:y] = state[:y] - leg_offset
              when 3
                state[:x] = state[:x] + leg_offset
              when 4
                state[:y] = state[:y] + leg_offset
              end
            true
          end
        end

        def build_spiral
          loop do
            break unless location[:step] < input
            step
          end
          location[:step]
        end

        def sum_neighbours
          sum = 0
          n = []
          n[0] = [coords(:x) - 1, coords(:y)]
          n[1] = [coords(:x) - 1, coords(:y) + 1]
          n[2] = [coords(:x),     coords(:y) + 1]
          n[3] = [coords(:x) + 1, coords(:y) + 1]
          n[4] = [coords(:x) + 1, coords(:y)]
          n[5] = [coords(:x) + 1, coords(:y) - 1]
          n[6] = [coords(:x), coords(:y) - 1]
          n[7] = [coords(:x) - 1, coords(:y) - 1]
          n.each do |c|
            neighbour = spiral.find { |s| s[:position] == c }
            sum += neighbour[:value] if neighbour
          end
          sum
        end

        def step
          location[:position] = next_coords(location[:orientation])
          location[:step] = sum_neighbours
          spiral << {position: location[:position], value: location[:step]}
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
            .yield_self { |next_coord| spiral.map{ |s| s[:position]}.include?(next_coord) }
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

        attr_reader :input, :stage, :location, :spiral, :state, :input_found
      end
    end
  end
end
