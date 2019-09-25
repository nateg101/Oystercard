# frozen_string_literal: true
require 'station'

describe Station do
  # subject(:station) { described_class.new(name, zone) }

    subject { described_class.new(name: "Aldgate", zone: 2)}

    it 'knows it has a name' do
      expect(station.name).to eq "Aldgate"
    end

    it 'knows what zone it is in' do
      expect(station.zone).to eq 2
    end
end
