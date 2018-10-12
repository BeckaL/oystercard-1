require_relative 'journey'

class JourneyLog

  attr_reader :entry_station, :exit_station, :journeys, :current_journey

  def initialize
    @journeys = []
    @current_journey = {entry_station: nil, exit_station: nil}
  end

  def start(station)
    if @current_journey[:entry_station].nil?
      entry_zone = station.zone
      @current_journey[:entry_station] = station.name
    else
      @journeys << @current_journey
      @current_journey[:entry_station] = station.name
      incomplete_journey
    end
  end

  def finish(station)
    @exit_zone = station.zone
    @current_journey[:exit_station] = station.name
    @journeys << @current_journey
    if @current_journey[:entry_station].nil?
      @current_journey = {entry_station: nil, exit_station: nil}
      incomplete_journey
    else
      @current_journey = {entry_station: nil, exit_station: nil}
      complete_journey
    end
  end

  def incomplete_journey(journey = Journey.new)
    journey.fare(false)
  end

  def complete_journey(journey = Journey.new)
    journey.fare(true)
  end
end
