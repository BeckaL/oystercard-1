require_relative 'journey_log'

class Oystercard
  attr_reader :balance
  DEFAULT_LIMIT = 90
  MINIMUM_CHARGE = 1

  def initialize(limit = DEFAULT_LIMIT, journeylog = JourneyLog)
    @balance = 0
    @limit = limit
    @journey = journeylog.new
  end

  def top_up(amount)
    raise "Limit of £#{@limit} exceeded" if (@balance + amount) > @limit
    @balance += amount
  end

  def touch_in(station)
    raise "not enough money" if @balance < MINIMUM_CHARGE
    potential_fare = @journey.start(station)
    deduct(potential_fare) if potential_fare.is_a? Integer
  end

  def touch_out(station)
    fare = @journey.finish(station)
    deduct(fare)
  end


  def deduct(amount)
    @balance -= amount
  end

end
