require_relative 'journey'

class JourneyLog

  attr_reader :entry_station, :exit_station, :journeys, :current_journey

  def initialize
    @journeys = []
    @current_journey = {entry_station: nil, exit_station: nil}
  end

  def start(station)
    return @current_journey[:entry_station] = station if @current_journey[:entry_station].nil?
    @journeys << @current_journey
    charge = reset_journey_and_return_fare(false)
    @current_journey[:entry_station] = station
    return charge
  end

  def finish(station)
    @current_journey[:exit_station] = station
    @journeys << @current_journey
    @current_journey[:entry_station].nil? ? complete = false : complete = true
    reset_journey_and_return_fare(complete)
  end

  private

  def reset_journey_and_return_fare(complete, journey = Journey)
    my_journey = journey.new
    charge = my_journey.fare(@current_journey[:entry_station], @current_journey[:exit_station], complete)
    @current_journey = {entry_station: nil, exit_station: nil}
    return charge
  end

end
