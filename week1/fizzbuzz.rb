if __FILE__ == $0
	puts "Fizz Buzz...!"
	puts "Nhap chuoi:"
	array = gets.chomp.split(" ")
	array.each do |element|
		number = element.to_i
		if number%2 != 0 && number%3 != 0
			print "X  "
			STDOUT.flush
		else
			if number%2 == 0
				print "Fizz"
				STDOUT.flush
			end
			if number%3 == 0
				print "Buzz"
				STDOUT.flush
			end
			print "  "
			STDOUT.flush
		end
	end
	puts ""
end