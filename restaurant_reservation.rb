#!/usr/bin/env ruby
# encoding: utf-8
require 'nokogiri'
require 'open-uri'
require 'date'
require 'pry'
require 'csv'
require 'time'
final_times = []
url = "http://www.opentable.com/goosefoot?DateTime=2015-07-25%2019%3A00&Covers=2&OnlyOffers=false&RestaurantIDs=71881&MetroId=3#"
doc = Nokogiri::HTML(open(url))
doc.xpath('//*[@id="dtp-results"]/div/ul/li/a').each do |w|
  final_times.push w.text.split(" PM")[0]
end
puts final_times
if final_times.length > 0
  puts "reservation_available"
else
  puts "no availability"
end