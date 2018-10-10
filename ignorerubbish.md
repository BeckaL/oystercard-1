require './lib/station'
require './lib/oystercard'
require './lib/journey'

aldgate = Station.new("Aldgate", 1)
waterloo = Station.new("Waterloo", 1)
card = Oystercard.new
card.top_up(10)
journey = card.touch_in(aldgate)
card.in_journey?
