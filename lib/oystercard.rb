#require 'journey'

class Oystercard
  attr_reader :balance
  DEFAULT_LIMIT = 90
  MINIMUM_CHARGE = 1

  def initialize(limit = DEFAULT_LIMIT)
    @balance = 0
    @limit = limit
  end

  def top_up(amount)
    raise "Limit of £#{@limit} exceeded" if (@balance + amount) > @limit
    @balance += amount
  end

  def touch_in(station)
    raise "not enough money" if @balance < MINIMUM_CHARGE
  end

  def touch_out(station)

  end


  def deduct(amount)
    @balance -= amount
  end

end
