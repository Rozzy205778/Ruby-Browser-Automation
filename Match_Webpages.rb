#!/usr/bin/env ruby

require 'open-uri'
require 'date'

File.open("urlList.txt","r").each_line do |url|
	url.chomp!
	urlSplit = url.split("/")
	filename = "_" + urlSplit[2] + ".txt"
	thisMonth = open(url).read
	thisMonth.chomp!
	
	if File.exist?(filename)
		lastMonth = File.read(filename)
		lastMonth.chomp!
		todayDate = Date.today

		if thisMonth == lastMonth
			File.open("matchLog.txt","a") do |x|
				x.puts "#{url} Y #{todayDate}"
			end
		else
			File.open("matchLog.txt","a") do |x|
				x.puts "#{url} N #{todayDate}"
			end
			File.open(filename,"w") do |x|
				x.puts thisMonth
			end
		end
	else
		File.open(filename,"w") do |x|
			x.puts thisMonth
		end
	end
end
