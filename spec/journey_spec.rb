require "journey"

describe Journey do

let(:penalty_fare) { Journey::PENALTY_FARE }
let(:min_fare) { Journey::MIN_FARE }
let(:station1) { double :station, zone: 1 }
let(:station2) { double :station, zone: 1 }
let(:station3) { double :station, zone: 7 }
subject(:journey) { described_class.new(station1,station2) }
subject(:journey2) { described_class.new(station1,station3) }

  describe '#fare' do

    it "charges minimum fare when you travel in the same zone" do
     expect(journey.fare).to eq min_fare
    end

    it "charges correct fare when you travel between zones" do
     expect(journey2.fare).to eq 7
    end

    it "charges penalty fare when you dont correctly touch in and touch out" do
     incomplete_journey = Journey.new(nil, station1)
     expect(incomplete_journey.fare).to eq penalty_fare
    end
  end
end
