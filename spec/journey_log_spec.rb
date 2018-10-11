require 'journey_log'

describe JourneyLog do

  it { respond_to(:start) }
  it { respond_to(:finish) }
  it { respond_to(:journeys) }

  let(:entry_station) { double :station, name: "aldgate", zone: 6 }

  describe '#start' do
    it 'stores start station' do
      log = JourneyLog.new(Journey)
      log.start(entry_station)
      expect(log.current_journey_hash).to eq({:entry => entry_station, :end => nil})
    end

  end

end
