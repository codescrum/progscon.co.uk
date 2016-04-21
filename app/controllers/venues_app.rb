$: << File.join(File.dirname(__FILE__), "..", "models")

require 'sinatra'
require 'venue_finder'
require 'awesome_print'
require 'pry'

enable :sessions
set :views, "#{settings.root}/../views"
set :public_folder, "#{settings.root}/../../public"

helpers do
  include Rack::Utils
  alias_method :h, :escape_html

  def checker(boolean)
    'checked' if boolean
  end

  def address(address)
    begin
      location = "#{address['address']}&nbsp;#{address['postalCode']}"
    rescue
      "&nbsp;"
    end
  end
end

get '/' do
  erb :index
end

post '/' do
  @venues = VenueFinder.instance.find current_user, params[:query] if params[:query]
  @venues.each do |venue|
    puts venue[:name]
    puts address(venue[:location])
  end
  erb :index
end

def current_user
  session["session_id"]
end
