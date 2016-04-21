# Ruby Application Demo for [Progscon.co.uk](http://progscon.co.uk)

ProgSCon is The Programming Conference. A one day conference about Programming. This is the demo of my talk about Ruby and Rails.

This is a code kata to explore the interaction with third-party APIs with good testing practice.

# The project

Build a search interface that finds venues (from Foursquare).

Run application with:

    bundle
    ruby venues_app.rb

Run tests with:

    bundle exec rspec

Deploy in production using Heroku with:

    heroku apps:create --region eu
    git push heroku master
    heroku open

# Special Status for Progscon.co.uk

The endpoint has been mocked and always returns pre-recorded data for the search keyword 'video'.

Product Requirements:

* User should be able to search for venues via the provided proxy and see their details.
