class JourneyLog

  attr_reader :current_journey_hash

  def initialize(journey_class)
    @journeys = []
    @journey_class = journey_class
    @current_journey_hash = {:entry => nil, :end => nil}
  end

  def start(station)
    @current_journey = @journey_class.new(station)
    @current_journey_hash[:entry] = station
  end

  def finish
    @current_journey.finish
    @journeys << @current_journey
  end

  def journeys
    @journeys
  end

end
