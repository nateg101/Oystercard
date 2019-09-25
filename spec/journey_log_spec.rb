require "journey_log"

describe JourneyLog do


it "stores one journey object when you finish a journey" do
  subject.start(:station)
  subject.finish(:station)
  expect(subject.journeys[0].class).to eq Journey
end




end
