require './lib/station'
require './lib/oystercard'
require './lib/journey'

aldgate = Station.new("Aldgate", 1)
waterloo = Station.new("Waterloo", 1)
brixton = Station.new("Brixton", 2)
bethnal_green = Station.new("Bethnal Green", 2)
card = Oystercard.new
card.top_up(10)
journey = card.touch_in(aldgate)
card.in_journey?

card.journeys
card.touch_in(brixton)
card.touch_out(bethnal_green)
card.touch_out(waterloo)
