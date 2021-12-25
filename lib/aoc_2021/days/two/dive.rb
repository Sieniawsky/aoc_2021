# frozen_string_literal: true

module Aoc2021
  module Days
    module Two
      # Class for solving Dive!
      class Dive
        STRATEGIES = %i[simple with_aim].freeze

        def initialize(raw_commands: "")
          @raw_commands = raw_commands
        end

        def compute_position(strategy: :simple)
          raise(ArgumentError, "Unsupported strategy: #{strategy}") unless STRATEGIES.include?(strategy)

          commands = parse_commands
          return 0 if commands.empty?

          coordinates = nil
          commands.each do |command|
            coordinates = send("process_command_#{strategy}".to_sym, command: command, coordinates: coordinates)
          end

          coordinates[0..1].reduce(&:*)
        end

        private

        def parse_commands
          @raw_commands.split("\n").map do |elem|
            command_elements = elem.split(" ")
            command_elements[1] = command_elements[1].to_i
            command_elements
          end
        end

        def process_command_simple(command:, coordinates:)
          coordinates ||= [0, 0]

          case command.first
          when "forward"
            coordinates[0] += command[1]
          when "up"
            coordinates[1] -= command[1]
            raise(ArgumentError, "Cannot go above depth 0") if coordinates[1].negative?
          when "down"
            coordinates[1] += command[1]
          else
            raise(ArgumentError, "Command not supported: #{command.first}")
          end

          coordinates
        end

        def process_command_with_aim(command:, coordinates:)
          coordinates ||= [0, 0, 0]

          case command.first
          when "forward"
            coordinates[0] += command[1]
            coordinates[1] += coordinates[2] * command[1]
            raise(ArgumentError, "Cannot go above depth 0") if coordinates[1].negative?
          when "up"
            coordinates[2] -= command[1]
          when "down"
            coordinates[2] += command[1]
          else
            raise(ArgumentError, "Command not supported: #{command.first}")
          end

          coordinates
        end
      end
    end
  end
end
