require 'oystercard'

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

  def fare(complete = true)
    if complete
      Oystercard::MINIMUM_CHARGE
    else
      MAX_PENALTY
    end
  end
end
