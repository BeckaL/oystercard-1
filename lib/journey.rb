# require 'oystercard'

class Journey

MAX_PENALTY = 6
MINIMUM_CHARGE = 1

  def fare(entry_station, exit_station, complete = true)
    return MAX_PENALTY if !complete
    zones_travelled = (entry_station.zone - exit_station.zone).abs
    fares =  {0 => 1,
              1 => 2,
              2 => 3,
              3 => 4}
    return fares[zones_travelled]
  end

end
