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


    it "raises an error if balance is less than fare" do
      subject.top_up(0.5)
      expect {subject.touch_in(entry_station)}.to raise_error "not enough money"
    end
    it "deducts the fare when you touch out" do
      pending
      subject.top_up(5)
      subject.touch_in(entry_station)
      allow(subject.current_journey).to receive(:add_exit_station).with(exit_station)
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-Oystercard::MINIMUM_CHARGE)
    end
    it "passes on the entry station after touch in" do
      pending
      subject.top_up(5)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end


    it "deducts 6 when two touch ins have been made" do
      pending
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_in(entry_station)
      expect(subject.balance).to eq 4
    end
  end
end
