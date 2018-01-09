#!/usr/bin/env ruby

require 'json'

file = ARGV[0]

data = []
data = JSON.parse(IO.read(file)) unless file.nil?

def list(data)
  data.each_with_index do |elem, index|
    puts "#{index}. #{elem[:name]}"
  end
end

def list_new(data)
  print "Name: "
  name = gets.chomp
  data.push({ name: name })
end

def list_edit(data)
end

def list_edit_name(data, number)
end

def list_add_tag(data, number)
end

def list_delete_tag(data, number)
end

def list_exit(data)
  print "Output name (blank to overwrite): "
  name = gets.chomp
  name = file if name.empty? # this breaks
  IO.write(name, data.to_json)
  exit
end

puts "Ready"

while true
  print "> "
  case gets.chomp
  when "list"
    list(data)
  when "new"
    list_new(data)
  when "edit"
    list_edit(data)
  when "exit"
    list_exit(data)
  else
    #print help
  end
end
