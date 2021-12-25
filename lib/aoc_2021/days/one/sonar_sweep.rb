# frozen_string_literal: true

module Aoc2021
  module Days
    module One
      # Class for solving SonarSweep
      class SonarSweep
        def initialize(raw_depths: "")
          @raw_depths = raw_depths
        end

        def count_increases_simple
          count_increases(depths: parse_depths)
        end

        def count_increases_windowed
          depths = parse_depths
          return 0 if depths.empty? || depths.size < 4

          windowed_depths = []
          index = 0

          while true
            depths_for_window = depths[index..index + 2]
            break if depths_for_window.size < 3

            windowed_depths.push(depths_for_window.reduce(&:+))
            index += 1
          end

          count_increases(depths: windowed_depths)
        end

        private

        def count_increases(depths: [])
          return 0 if depths.empty? || depths.size == 1

          count = 0
          index = 1
          previous = depths.first

          while index < depths.size
            current = depths[index]

            count += 1 if current > previous

            previous = current
            index += 1
          end

          count
        end

        def parse_depths
          @raw_depths.split("\n").map { |elem| elem.strip.to_i }
        end
      end
    end
  end
end
