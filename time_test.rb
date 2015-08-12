require 'nokogiri'
require 'open-uri'
require 'date'
require 'pry'
require 'csv'
require 'time'

puts "start_crawl"
start_time = Time.now
puts start_time
sleep(120)
end_time = Time.now
puts end_time

crawl_time = (end_time - start_time)/60

puts "end_Crawl"
puts "#{crawl_time} minutes"
