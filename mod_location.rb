#!/usr/bin/ruby

require 'json'
require 'net/http'

class Location
  def initialize 
#    @googlelocation = JSON.parse(`wget -O- -q "http://maps.googleapis.com/maps/api/geocode/json?address=koertestrasse 35 berlin"`)['results'][0]['geometry']['location']
    http = Net::HTTP.get_response(URI.parse("http://maps.googleapis.com/maps/api/geocode/json?address=koertestrasse%2035%20berlin"))
    data = http.body
    @googlelocation = JSON.parse(data)['results'][0]['geometry']['location']
  end
  def get_location
    return @googlelocation
  end
end
