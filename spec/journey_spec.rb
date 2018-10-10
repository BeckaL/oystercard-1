require 'journey'
require 'pry'

describe Journey do
  let (:oyster) {double :oyster}
  let (:station_1) {double :station_1, name: "Aldgate East", zone: 1}
  let (:station_2) {double :station_2, name: "Waterloo", zone: 1}

  it "has an entry station" do
    journey = Journey.new(station_1)
    expect(journey.entry_station).to eq "Aldgate East"
  end

  it "has an exit station" do
    journey = Journey.new(station_1)
    allow(oyster).to receive(:touch_out).with(station_2).and_return station_2
    exit_station = oyster.touch_out(station_2)
    journey.add_exit_station(exit_station)
    expect(journey.exit_station).to eq "Waterloo"
  end

  it "returns 1 when journey completed" do
    journey = Journey.new(station_1)
    allow(oyster).to receive(:deduct).with(1)
    expect(journey.fare(true, oyster)).to eq 1
  end

  it "returns 6 when journey incomplete" do
    journey = Journey.new(station_1)
    allow(oyster).to receive(:deduct).with(6)
    expect(journey.fare(false, oyster)).to eq 6
  end
end
