#height = 8
#0*" "+ 9*#
#1*" "+ 8*#
#2*" "+ 7*#
#3*" "+ 6*#
#4*" "+ 5*#
#5*" "+ 4*#
#6*" "+ 3*#
#7*" "+ 2*#
while True:
	h = int(raw_input("Enter a number between 0 and 23"))
	if h >= 0 and h < 24:
		break

a = h - 1
b = 2

while a >= 0: 
	line = a*" "+ b*"#" 
	print line
	a -= 1
	b += 1

