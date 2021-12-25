# frozen_string_literal: true

require "spec_helper"

RSpec.describe Aoc2021::Days::One::SonarSweep do
  describe "Part 1" do
    subject { described_class.new(raw_depths: raw_depths).count_increases_simple }

    let(:raw_depths) { "" }

    context "when there are no depths" do
      it { expect(subject).to eq(0) }
    end

    context "when there is a single depth" do
      let(:raw_depths) { "420" }

      it { expect(subject).to eq(0) }
    end

    context "with actual values" do
      let(:raw_depths) { read_file("days/one/sonar_sweep_depths.txt") }
      let(:expected_depths) { 1564 }

      it "determines the correct number of increases" do
        expect(subject).to eq(expected_depths)
      end
    end
  end

  describe "Part 2" do
    subject { described_class.new(raw_depths: raw_depths).count_increases_windowed }

    let(:raw_depths) { "" }

    context "when there are no depths" do
      it { expect(subject).to eq(0) }
    end

    context "when depths has no window information" do
      let(:raw_depths) { "" }

      it { expect(subject).to eq(0) }
    end

    context "with a single depth and window" do
      let(:raw_depths) { "420" }

      it { expect(subject).to eq(0) }
    end

    context "with actual values" do
      let(:raw_depths) { read_file("days/one/sonar_sweep_depths.txt") }
      let(:expected_depths) { 1611 }

      it "determines the correct number of increases" do
        expect(subject).to eq(expected_depths)
      end
    end
  end
end
