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
    expect(log.journeys).to eq [{entry_station: aldgate, exit_station: brixton}]
  end

  it 'stores multiple journeys' do
    log = JourneyLog.new
    log.start(aldgate)
    log.finish(brixton)
    log.start(aldgate)
    log.finish(brixton)
    expect(log.journeys).to eq [{entry_station: aldgate, exit_station: brixton}, {entry_station: aldgate, exit_station: brixton}]
  end

  it 'detects incomplete journeys' do
    log.start(aldgate)
    log.start(aldgate)
    expect(log.journeys).to eq [{entry_station: aldgate, exit_station: nil }]
  end

end
