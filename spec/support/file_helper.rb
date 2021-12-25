# frozen_string_literal: true

require "aoc_2021"

FIXTURE_BASE_PATH = "spec/fixtures/files/"

module FileHelper
  def read_file(path)
    File.read(Aoc2021.root.parent.join(FIXTURE_BASE_PATH, path))
  end
end
