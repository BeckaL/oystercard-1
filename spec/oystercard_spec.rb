require 'oystercard'

describe Oystercard do
  it 'has a balance of 0' do
    expect(subject.balance).to eq 0
  end

  describe "#top up" do
    it "tops up the card by 10" do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end
    it "raises an error if limit is exceeded" do
      max_balance = Oystercard::DEFAULT_LIMIT
      expect{subject.top_up(max_balance + 1)}.to raise_error "Limit of £#{max_balance} exceeded"
    end
  end

  describe "journey methods" do
    let(:entry_station) {double :station, name: "Aldgate East", zone: 1}
    let(:exit_station) {double :station, name: "Waterloo", zone: 1}
    let(:journey_log) {double :journey_log}

    it "raises an error if balance is less than fare" do
      subject.top_up(0.5)
      expect {subject.touch_in(entry_station)}.to raise_error "not enough money"
    end

    it "deducts the fare when you touch out" do
      subject.top_up(5)
      subject.touch_in(entry_station)
      allow(journey_log).to receive(:finish).with(exit_station).and_return Oystercard::MINIMUM_CHARGE
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-Oystercard::MINIMUM_CHARGE)
    end

  end
end
