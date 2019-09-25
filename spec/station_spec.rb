# frozen_string_literal: true
require 'station'

describe Station do
  # subject(:station) { described_class.new(name, zone) }

    subject { described_class.new("Aldgate", 2)}

    it 'knows it has a name' do
      expect(subject.name).to eq "Aldgate"
    end

    it 'knows what zone it is in' do
      expect(subject.zone).to eq 2
    end
end
