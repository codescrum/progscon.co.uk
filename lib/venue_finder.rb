require 'venue_finder/foursquare_proxy'
require 'venue_finder/venue_agent'

module VenueFinder
  def self.instance
    @venue_agent ||= VenueAgent.new(FoursquareProxy.new)
  end
end
