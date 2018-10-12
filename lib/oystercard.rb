require_relative 'journey_log'

class Oystercard
  attr_reader :balance, :entry_station, :journeys, :current_journey, :journey_log
  attr_writer :journeys
  DEFAULT_LIMIT = 90
  MINIMUM_CHARGE = 1

  def initialize(limit = DEFAULT_LIMIT)
    @balance = 0
    @limit = limit
    @entry_station
    @journeys = []
    @current_journey
    @journey_log = JourneyLog.new(self)
  end

  def top_up(amount)
    raise "Limit of £#{@limit} exceeded" if (@balance + amount) > @limit
    @balance += amount
  end

  def touch_in(station)
    raise "not enough money" if @balance < MINIMUM_CHARGE
    @entry_station = station
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
  end

  def in_journey?
    @current_journey != nil
  end


  def deduct(amount)
    @balance -= amount
  end

end
