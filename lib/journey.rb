# require 'oystercard'

class Journey

MAX_PENALTY = 6

attr_reader :entry_station, :entry_zone, :exit_station, :exit_zone

  def initialize(entry_station)
    @entry_station = entry_station.name
    @entry_zone = entry_station.zone
  end

  def add_exit_station(station)
    @exit_station = station.name
    @exit_zone = station.zone
  end

  def fare(complete = true, oystercard)
    if complete
      fare = Oystercard::MINIMUM_CHARGE
    else
      fare = MAX_PENALTY
    end
    oystercard.deduct(fare)
    return fare
  end
end
