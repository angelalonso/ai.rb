#!/usr/bin/ruby

# Ruby modularity wrapper #
###########################

## WHAT THIS SHOULD DO:
# Receive a list of ruby files (all .rb in a directory, maybe?)
# "Require" them
# Read the possible classes in them(one per ruby file, maybe?), and show them as possible parameters when someone asks for help (--help)
# When the parameter is given, give way to that ruby code. "That ruby code" should handle errors

# This will be the array of modules found
@mod4uselist = []


# This is the object that defines a module found
class Mod4use
#  attr_accessor :name,:methods

  def initialize(name, methods)
    @name = name
    @methods = methods
  end

  def getname
    return @name
  end

  def getmethods
    return @methods
  end
end


# This searches our list of module rb files to build the array of them
def load_all
  # List of files starting with "mod_" and ending with ".rb" in the given directory
  basedir = '.'
  files = Dir.glob("#{basedir}/mod_*.rb")
  files.each do |modu|
    classname = ""
    methodarray = []
    require modu
    File.open(modu).each do |line|
      if line["class"]
        classline_words = line.split 
        classname = classline_words[1]
      end
      if line["def"] && !line["initialize"]
        defline_words = line.split
        methodarray << defline_words[1]
      end
    end
    @mod4uselist << Mod4use.new(classname,methodarray)
  end
end

def give_help
  puts "Syntax:" 
  puts "#{__FILE__} <mode> <params>"
  puts "\nmodes:"
  @mod4uselist.each do |entry|
    puts ("  - " + entry.getname)
    entry.getmethods.each do |methd|
      print ("     " + methd + "\n")
    end 
  end 
end

def execute(mod4use,method4use)
  possible_mods = []
  @mod4uselist.each do |entry|
    if entry.getname.include? mod4use
      possible_mods << entry.getname
    end
  end
  
  if possible_mods.length > 1
    puts "which one?"
    puts possible_mods
  end
end


load_all()
if @mod4uselist.map(&:getname).join(' ').include? ARGV[0]
  execute(ARGV[0],ARGV[1])
else
  give_help()
end
