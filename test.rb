#!/usr/bin/ruby

# Ruby modularity wrapper #
###########################

## WHAT THIS SHOULD DO:
# Receive a list of ruby files (all .rb in a directory, maybe?)
# "Require" them
# Read the possible classes in them(one per ruby file, maybe?), and show them as possible parameters when someone asks for help (--help)
# When the parameter is given, give way to that ruby code. "That ruby code" should handle errors


def load_all
  # List of files starting with "mod_" and ending with ".rb" in the given directory
  basedir = './mods'
  files = Dir.glob("#{basedir}/mod_*.rb")
  files.each do |exm|
   # require "#{exm}"
    require exm
    File.open(exm).each do |line|
      if line["class"]
        puts line
        words = line.split 
        puts words[1]
      end
    end
  end
  test = Test.new
end

def give_help
  puts "Syntax:" 
  puts "#{__FILE__} <mode> <params>"
  puts "\nmodes:"
end

load_all()
give_help()
