#!/usr/bin/ruby

# Ruby modularity wrapper #
###########################

## WHAT THIS SHOULD DO:
# Receive a list of ruby files (all .rb in a directory, maybe?)
# "Require" them
# Read the possible classes in them(one per ruby file, maybe?), and show them as possible parameters when someone asks for help (--help)
# When the parameter is given, give way to that ruby code. "That ruby code" should handle errors

@helplist = []

def load_all
  # List of files starting with "mod_" and ending with ".rb" in the given directory
  basedir = '.'
  files = Dir.glob("#{basedir}/mod_*.rb")
  files.each do |exm|
    require exm
    File.open(exm).each do |line|
      if line["class"]
        words = line.split 
        @helplist = @helplist + [words[1]]
      end
    end
  end
end

def give_help
  puts "Syntax:" 
  puts "#{__FILE__} <mode> <params>"
  puts "\nmodes:"
  puts @helplist
end

load_all()
if @helplist.include? ARGV[0]
  puts "found"
end
  give_help()
end
