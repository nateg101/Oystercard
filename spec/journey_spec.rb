require "journey"

describe Journey do

let(:penalty_fare) { Journey::PENALTY_FARE }
let(:min_fare) { Journey::MIN_FARE }
let(:station) { double :station }

subject(:journey) { described_class.new(:station,:station) }

it "charges minimum fare when you correctly touch in and touch out" do
 expect(journey.fare).to eq min_fare
end

it "charges penalty fare when you dont correctly touch in and touch out" do
 incomplete_journey = Journey.new(nil, station)
 expect(incomplete_journey.fare).to eq penalty_fare
end



end
