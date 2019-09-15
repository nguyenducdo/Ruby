def ptb2(a,b,c)
	n1 = nil
	n2 = nil
	if a == 0
		n1 = -c/b
		puts "Phuong trinh co nghiem duy nhat x = #{n1}"
	else
		delta = b**2 - 4*a*c
		if delta < 0
			n1 = nil
			n2 = nil
			puts "Phuong trinh vo nghiem"
		elsif delta == 0
			n1 = n2 = -b/(2*a)
			puts "Phuong trinh co nghiem kep x1 = x2 = #{n1}"
		else
			n1 = (-b-Math.sqrt(delta))/(2*a)
			n2 = (-b+Math.sqrt(delta))/(2*a)
			puts "Phuong trinh co 2 nghiem phan biet:"
			puts "   x1 = #{n1}"
			puts "   x2 = #{n2}"
		end
	end
end
if __FILE__ == $0
	puts "Giai phuong trinh ax^2 + bx + c = 0"
	puts "a = "
	a = gets()
	a = a.to_i
	puts "b = "
	b = gets()
	b = b.to_i
	puts "c = "
	c = gets()
	c = c.to_i
	ptb2(a,b,c)
end