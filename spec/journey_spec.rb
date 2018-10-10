require 'journey'

describe Journey do
  let (:oyster) {double :oyster}
  let (:station) {double :station, name: "Waterloo", zone: 1}

  it "has an entry station" do
    journey = Journey.new("Aldgate East", 1)
    expect(journey.entry_station).to eq "Aldgate East"
  end

  it "has an exit station" do
    journey = Journey.new("Aldgate East", 1)
    allow(oyster).to receive(:touch_out).with(station).and_return station
    expect(journey.exit_station).to eq "Waterloo"
  end
end
