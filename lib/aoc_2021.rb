# frozen_string_literal: true

require_relative "aoc_2021/version"

# Project for solving AoC 2021 puzzles.
module Aoc2021
  def self.root
    Pathname.new(File.expand_path(__dir__))
  end

  Dir.glob(Aoc2021.root.join("**/*.rb")).sort.each { |file| require file }
end
