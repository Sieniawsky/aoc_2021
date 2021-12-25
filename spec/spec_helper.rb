# frozen_string_literal: true

require "bundler/setup"
require "aoc_2021"
require "awesome_print"

spec_path = Aoc2021.root.parent.join("spec/support/**/*.rb")
Dir.glob(spec_path).sort.each { |file| require file }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include FileHelper
end
