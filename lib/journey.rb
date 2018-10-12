# require 'oystercard'

class Journey

MAX_PENALTY = 6
MINIMUM_CHARGE = 1

  def fare(complete = true)
    if complete
      fare = MINIMUM_CHARGE
    else
      fare = MAX_PENALTY
    end
    return fare
  end
end
