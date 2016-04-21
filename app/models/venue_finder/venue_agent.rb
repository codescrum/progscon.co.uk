
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
  c.allow_http_connections_when_no_cassette = false #Use when running with webkit
  #c.ignore_localhost = false
end

module VenueFinder
  # An agent that searches for venues and keep favourties.
  class VenueAgent

    # Initialize dependencies.
    # @param foursquare_proxy The Foursquare Proxy to retrieve the venues from.
    # @param favourites_store The store to save/retrieve the favourites list.
    def initialize(foursquare_proxy)
      @foursquare_proxy = foursquare_proxy
    end

    # Find venues based on a query string and displays favourite results if present.
    def find(user_id, query)
      venues = nil
      VCR.use_cassette('video', :match_requests_on => [:method]) do
        venues = @foursquare_proxy.search_venues(query)
      end
      parse_results(venues)
    end

    private

    def parse_results(venues)
      venues.map do |venue|
        {
          :venue_id => venue["id"],
          :name => venue["name"],
          :canonical_url => venue["canonicalUrl"],
          :location => venue["location"]
        }
      end
    end
  end
end
