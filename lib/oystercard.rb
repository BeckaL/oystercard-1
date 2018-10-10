#require 'journey'

class Oystercard
  attr_reader :balance, :entry_station, :journeys, :current_journey
  attr_writer :journeys
  DEFAULT_LIMIT = 90
  MINIMUM_CHARGE = 1

  def initialize(limit = DEFAULT_LIMIT)
    @balance = 0
    @limit = limit
    @entry_station
    @journeys = []
    @current_journey
  end

  def top_up(amount)
    raise "Limit of £#{@limit} exceeded" if (@balance + amount) > @limit
    @balance += amount
  end

  def touch_in(station)
    raise "not enough money" if @balance < MINIMUM_CHARGE
    @entry_station = station
    if !@current_journey.nil?
      @current_journey.fare(false)
    end
    @current_journey = Journey.new(station)
  end

  def touch_out(station)
    @current_journey.add_exit_station(station)
    deduct(MINIMUM_CHARGE)
    @journeys << @current_journey
    @current_journey = nil
  end

  def in_journey?
    true if @current_journey != nil
  end

  def deduct(amount)
    @balance -= amount
  end

end
