#!/usr/bin/ruby

require './module_weather.rb'


class Command
  def initialize(command)
    @command = command
  end

  def do
    case @command
## LEARNT: Regexp, casi insensitive
    when /weather/i
      puts "El tiempo!"
      weather = Weather.new.get_temperature
    else
      puts "K.THX.BYE"
    end
  end
end


# Program-wide definitions
def show_help
  scriptname = File.basename(__FILE__)
  syntax = "#{scriptname} <parameter>"
  puts "Error! please keep the syntax in mind:"
  puts syntax
end


if ARGV.length == 0
  show_help
else
  com = Command.new(ARGV[0])
  com.do
end
