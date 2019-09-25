require "journey_log"

describe JourneyLog do

  describe '#journey_history' do

    it "stores one journey object when you finish a journey" do
      subject.start(:station)
      subject.finish(:station)
      expect(subject.journey_history[0].class).to eq Journey
    end
  end

  describe '#entry_station' do
    
    it "remembers and entry station" do
      subject.start(:station)
      expect(subject.entry_station).to eq :station
    end

    it "forgets the entry station when the journey" do
      subject.start(:station)
      subject.finish(:station)
      expect(subject.entry_station).to eq nil
    end
  end

end
