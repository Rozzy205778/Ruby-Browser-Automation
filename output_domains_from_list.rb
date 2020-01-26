inputFile = File.readlines('data.txt')

domains = File.readlines('domains.txt')

File.open('output.txt', 'w') do |f|
	inputFile.each do |line|
		domains.each do |domain|
			domain.chomp!
			if (line.include? domain) && !(line.include? ".gif") && !(line.include? ".png") && !(line.include? ".jpg") && !(line.include? ".js") && !(line.include? ".css")
				f.write line
			end
		end
	end
end
