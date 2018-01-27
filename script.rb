#!/usr/bin/env ruby

require 'json'

class List
  def initialize(filename = nil)
    @items = JSON.parse(IO.read(filename)) unless filename.nil?
    @items ||= []
  end

  # Should be able to push/pop/delete/etc
  def items(tag = nil)
    if tag.nil?
      @items
    else
      @items.each { |item| item if item['tags'].include? tag }
    end
  end
end

list = List.new(ARGV[0])
ARGV.clear # so we can gets properly later on
quit = false

puts "Ready"

until quit
  print "> "
  case gets.chomp
  when "list"
    list.items.each_with_index { |item, index| puts "#{index}. #{item['name']}" }
  when "new"
    print "Name: "
    name = gets.chomp
    print "Tags: "
    tags = gets.chomp.split(',').map { |tag| tag.strip }
    list.items.push({ 'name' => name, 'tags' => tags })
  when "edit"
    print "Element #: "
    index = gets.chomp.to_i
    print "Old Name: #{list.items[index]['name']}\nNew Name: "
    list.items[index]['name'] = gets.chomp
  when "delete"
    print "Element #: "
    index = gets.chomp.to_i
    print "Name: #{list.items[index]['name']}\nConfirm (y/n)? "
    list.items.delete_at(index) if gets.chomp == 'y'
  when "exit"
    quit = true
  else
    #print help
  end
end

print "File to save to: "
outfile = gets.chomp
IO.write(outfile, list.items.to_json) unless outfile.empty?
puts "Done!"
