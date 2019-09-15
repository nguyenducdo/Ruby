def check(n)
	flag = true
	if n<2
		flag = false
	elsif n==2
		flag = true
	else 
		for i in 2..(Math.sqrt(n))
			if n % i == 0 
				flag = false
				break
			end
		end
	end
	flag
end
if __FILE__ == $0
	puts "Nhap so:"
	n = gets().to_i
	# n = n.to_i

	for i in 1..n-1
		flag = check(i)
		if flag
			print "#{i}  "
			STDOUT.flush
		end
	end
	
	
end