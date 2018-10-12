require 'journey'
require 'pry'

describe Journey do
  let (:oyster) {double :oyster}
  let (:station_1) {double :station_1, name: "Aldgate East", zone: 1}
  let (:station_2) {double :station_2, name: "Waterloo", zone: 1}

  it "returns 1 when journey completed" do
    journey = Journey.new
    allow(oyster).to receive(:deduct).with(1)
    expect(journey.fare(true)).to eq 1
  end

  it "returns 6 when journey incomplete" do
    journey = Journey.new
    allow(oyster).to receive(:deduct).with(6)
    expect(journey.fare(false)).to eq 6
  end
end
