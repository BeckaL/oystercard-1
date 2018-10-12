require 'journey_log'

describe JourneyLog do

  let (:aldgate) {double :station, name: 'Aldgate', zone: 1}
  let (:brixton) {double :station, name: 'Brixton', zone: 2}
  let (:log) { JourneyLog.new }
  let (:journey) {double :journey}



  it 'stores journeys' do
    log = JourneyLog.new
    log.start(aldgate)
    log.finish(brixton)
    expect(log.journeys).to eq [{entry_station: 'Aldgate', exit_station: 'Brixton'}]
  end

  it 'stores multiple journeys' do
    log = JourneyLog.new
    log.start(aldgate)
    log.finish(brixton)
    log.start(aldgate)
    log.finish(brixton)
    expect(log.journeys).to eq [{entry_station: 'Aldgate', exit_station: 'Brixton'}, {entry_station: 'Aldgate', exit_station: 'Brixton'}]
  end

  it 'detects incomplete journeys' do
    log.start(aldgate)
    log.start(aldgate)
    expect(log.journeys).to eq [{entry_station: 'Aldgate', exit_station: nil }]
  end

  it 'incomplete fare method returns max fare' do
    allow(journey).to receive(:new).and_return(journey)
    allow(journey).to receive(:fare).with(true).and_return 1
    allow(journey).to receive(:fare).with(false).and_return 6
    expect(log.incomplete_journey).to eq 6
  end

  it 'complete fare method returns min fare' do
    allow(journey).to receive(:new).and_return(journey)
    allow(journey).to receive(:fare).with(true).and_return 1
    allow(journey).to receive(:fare).with(false).and_return 6
    expect(log.complete_journey).to eq 1
  end

end
