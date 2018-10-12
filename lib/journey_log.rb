class JourneyLog

  attr_reader :current_journey_hash, :current_journey, :card

  def initialize(oyster, journey_class = Journey)
    @journeys = []
    @journey_class = journey_class
    @current_journey_hash = {:entry => nil, :end => nil}
    @current_journey
    @card = oyster
  end

  def start(station)
    @current_journey = @journey_class.new(@card)
    @current_journey_hash[:entry] = station
    # if !@current_journey.nil?
    #   @current_journey.get_journey(false, @current_journey_hash)
    #   @journeys << @current_journey
    # end
  end

  def finish(station)
    @current_journey_hash[:end] = station
    # if @current_journey_hash[:entry].nil?
    #   @current_journey = @journey_class.new(@card)
    #   @current_journey.get_journey(false, @current_journey_hash)
    # else
      @current_journey.get_journey(true, @current_journey_hash)
    # end
    @journeys << @current_journey_hash
    @current_journey_hash = {:entry => nil, :end => nil}
    @current_journey = nil
  end

  def journeys
    @journeys
  end

end
