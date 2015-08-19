#!/usr/bin/ruby

require 'json'
require './module_location'

class Weather
  def initialize 
## API docs here: http://openweathermap.org/current
    @location = Location.new
    @latitude = @location.get_location["lat"]
    @longitude = @location.get_location["lng"]

    http = Net::HTTP.get_response(URI.parse("http://api.openweathermap.org/data/2.5/weather?lat=#{@latitude}8&lon=#{@longitude}"))
    data = http.body
    @openweatherresult = JSON.parse(data)

  end

  def kelvin2celsius(temp_k)
    temp_c = temp_k - 273.15
    return temp_c
  end

  def get_temperature
    result = kelvin2celsius(@openweatherresult["main"]["temp"])
    puts result
  end
end
