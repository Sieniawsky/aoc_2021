# frozen_string_literal: true

require "spec_helper"

RSpec.describe Aoc2021::Days::Two::Dive do
  subject { described_class.new(raw_commands: raw_commands).compute_position(strategy: strategy) }

  context "Part 1" do
    let(:strategy) { :simple }

    let(:raw_commands) { "" }

    context "when there are no commands" do
      it { expect(subject).to eq(0) }
    end

    context "when there is a single depth" do
      let(:raw_commands) { "forward 2" }

      it { expect(subject).to eq(0) }
    end

    context "with unsupported command" do
      let(:raw_commands) { "backwards 2" }

      it { expect { subject }.to raise_error(ArgumentError, "Command not supported: backwards") }
    end

    context "when commands take the submarine above water level" do
      let(:raw_commands) { "up 2" }

      it { expect { subject }.to raise_error(ArgumentError, "Cannot go above depth 0") }
    end

    context "with actual values" do
      let(:raw_commands) { read_file("days/two/dive_commands.txt") }
      let(:expected_location) { 1_804_520 }

      it { expect(subject).to eq(expected_location) }
    end
  end

  describe "Part 2" do
    let(:strategy) { :with_aim }

    let(:raw_commands) { "" }

    context "when there are no commands" do
      it { expect(subject).to eq(0) }
    end

    context "when there is a single depth" do
      let(:raw_commands) { "forward 2" }

      it { expect(subject).to eq(0) }
    end

    context "with unsupported command" do
      let(:raw_commands) { "backwards 2" }

      it { expect { subject }.to raise_error(ArgumentError, "Command not supported: backwards") }
    end

    context "when commands take the submarine above water level" do
      let(:raw_commands) { "up 2\nforward 2" }

      it { expect { subject }.to raise_error(ArgumentError, "Cannot go above depth 0") }
    end

    context "with actual values" do
      let(:raw_commands) { read_file("days/two/dive_commands.txt") }
      let(:expected_location) { 1_971_095_320 }

      it { expect(subject).to eq(expected_location) }
    end
  end
end
