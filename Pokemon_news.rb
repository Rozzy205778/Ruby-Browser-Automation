#!/usr/bin/env ruby

require 'watir'

url = "https://www.businessinsider.com/category/nintendo-switch?r=US&IR=T"
browser = Watir::Browser.new
browser.goto(url)
sleep 2

browser.h2s(text: /Pok/).each do |match|
	puts match.text
end

browser.h3s(text: /Pok/).each do |match|
	puts match.text
end

gets
