#!/usr/bin/env ruby

require 'json'

class List
  attr_reader :data

  def initialize(filename = nil)
    @data = JSON.parse(IO.read(filename)) unless filename.nil?
    @data ||= { tags: [], items: [] }
  end

  # Should be able to push/pop/delete/etc
  def items(tag = nil)
    if tag.nil?
      @data[:items]
    else
      @data[:items].each { |item| item if item.tags.include? tag }
    end
  end

  def tags
    @data[:tags]
  end
end

class Item
  attr_reader :name
  attr_reader :tags

  def initialize(name, *tags)
    @name = name
    @tags = tags
  end
end

list = List.new(ARGV[0])

puts "Ready"

while true
  print "> "
  case gets.chomp
  when "list"
    list.items.each_with_index { |item, index| puts "#{index}. #{item.name}" }
  when "new"
    print "Name: "
    list.items.push Item.new(gets.chomp)
  when "edit"
  when "exit"
  else
    #print help
  end
end
