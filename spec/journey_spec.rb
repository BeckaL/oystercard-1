require 'journey'
require 'pry'

describe Journey do
  let (:oyster) {double :oyster}
  let (:station_1) {double :station_1, name: "Aldgate East", zone: 1}
  let (:station_2) {double :station_2, name: "Waterloo", zone: 1}
  let (:no_station) {double :nil_station, name: nil, zone: nil}
  let (:journey_log) {double :journey_log}
  let (:current_journey) {double :journey_log, {entry_station: station_1, exit_station: station_2}}

  it "returns correct fare when journey completed" do
    journey = Journey.new
    allow(oyster).to receive(:deduct)
    expect(journey.fare(station_1, station_2, true)).to eq 1
  end

  it "returns 6 when journey incomplete" do
    journey = Journey.new
    allow(oyster).to receive(:deduct).with(6)
    expect(journey.fare(station_1, no_station,false)).to eq 6
  end
end
