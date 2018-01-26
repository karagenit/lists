#!/usr/bin/env ruby

require 'json'

class List
  attr_reader :data

  def initialize(filename = nil)
    @data = JSON.parse(IO.read(filename)) unless filename.nil?
    @data |= { tags: [], items: [] }
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
  attr_reader :tags

  def initialize(*tags)
    @tags = tags
  end
end

list = List.new(ARGV[0])

puts "Ready"

while true
  print "> "
  case gets.chomp
  when "list"
  when "new"
  when "edit"
  when "exit"
  else
    #print help
  end
end
