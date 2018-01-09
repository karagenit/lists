#!/usr/bin/env ruby

require 'json'

file = ARGV[0]

data = 
if file.nil?
  []
else
  JSON.parse(IO.read(file))
end

def list
end

def list_new
end

def list_edit
end

def list_edit_name(number)
end

def list_add_tag(number)
end

def list_delete_tag(number)
end

def list_exit
  exit
end

puts "Ready"

while true
  case gets.chomp
  when "list"
    list
  when "new"
    list_new
  when "edit"
    list_edit
  when "exit"
    list_exit
  else
    #print help
  end
end
