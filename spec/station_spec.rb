# frozen_string_literal: true
require 'station'

describe Station do

    subject { described_class.new("Aldgate", 2)}

    describe '#name' do

      it 'knows it has a name' do
        expect(subject.name).to eq "Aldgate"
      end
    end

    describe '#zone' do

      it 'knows what zone it is in' do
        expect(subject.zone).to eq 2
      end
    end
end
