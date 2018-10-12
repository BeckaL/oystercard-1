# require 'oystercard'

class Journey

MAX_PENALTY = 6

attr_reader :entry_station, :entry_zone, :exit_station, :exit_zone

  def initialize(card)
    @card = card
  end

  def get_journey(complete, journey_hash)
    @entry_station = journey_hash[:entry].name
    @entry_zone = journey_hash[:entry].zone
    @exit_station = journey_hash[:exit].name
    @exit_zone = journey_hash[:exit].zone
    fare(complete)
  end

  def fare(complete = true)
    if complete
      fare = Oystercard::MINIMUM_CHARGE
    else
      fare = MAX_PENALTY
    end
    @card.deduct(fare)
    return fare
  end
end
