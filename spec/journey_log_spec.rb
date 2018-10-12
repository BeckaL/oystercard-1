require 'journey_log'

describe JourneyLog do

  it { respond_to(:start) }
  it { respond_to(:finish) }
  it { respond_to(:journeys) }

  let(:entry_station) { double :station, name: "aldgate", zone: 6 }
  let(:exit_station) { double :station, name: "brixton", zone: 2 }
  let(:journey) {double :journey}


  describe '#start' do
    it 'stores start station' do
      allow(journey).to receive(:finish).with(exit_station)
      allow(journey).to receive(:new).with(entry_station)
      log = JourneyLog.new(journey)
      log.start(entry_station)
      expect(log.current_journey_hash).to eq({:entry => entry_station, :end => nil})
    end

  end

  describe '#finish' do
    it 'stores a complete trip' do
      allow(journey).to receive(:finish).with(exit_station).and_return('done')
      allow(journey).to receive(:new).with(entry_station).and_return('done')
      binding.pry
      log = JourneyLog.new(journey)
      log.start(entry_station)
      log.finish(exit_station)
      expect(log.journeys[0]).to eq({:entry => entry_station, :end => exit_station})
    end

    it 'stores two complete trips' do
      allow(journey).to receive(:finish).with(exit_station)
      allow(journey).to receive(:new).with(entry_station)
      log = JourneyLog.new(journey)
      log.start(entry_station)
      log.finish(exit_station)
      log.start(entry_station)
      log.finish(exit_station)
      expect(log.journeys).to eq([{:entry => entry_station, :end => exit_station},{:entry => entry_station, :end => exit_station}] )
    end
  end


end
