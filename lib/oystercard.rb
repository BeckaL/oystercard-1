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
      @current_journey.fare(false, self)
      @journeys << @current_journey
    end
    @current_journey = Journey.new(station)
  end

  def touch_out(station)
    if @current_journey.nil?
      @current_journey = Journey.new(station)
      @current_journey.fare(false, self)
    else
      @current_journey.add_exit_station(station)
      @current_journey.fare(true, self)
    end
    @journeys << @current_journey
    @current_journey = nil
  end

  def in_journey?
    @current_journey != nil
  end

  def deduct(amount)
    @balance -= amount
  end

end
