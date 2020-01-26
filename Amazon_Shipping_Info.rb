#!/usr/bin/env ruby

require 'watir'

browser = Watir::Browser.new

if File.exist? File.expand_path "urlList.txt"
	File.open("urlList.txt","r").each_line do |url|
		if url.include? "amazon."
			url.chomp!
			browser.goto(url)
			sleep 2

			if browser.div(:id => "merchant-info").exists?
				merchantInfo = browser.div(:id => "merchant-info").text
				if merchantInfo.include? "Amazon"
				   puts browser.title + " - Amazon is shipping this item"
				else
					puts browser.title + " - Not shipped by Amazon"
				end
			else
				puts browser.title + " - No merchant info"
			end
		else
			puts "Not an Amazon page"
		end
	end
else
	puts "URL list not found"
end

puts "\nClick enter to exit"
gets

browser.close
