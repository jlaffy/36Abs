#take height and make h = height+1
#line is 2#+n where n=0 for n < h
h = int(raw_input("Enter a number between 0 and 23"))
a = 0 

while a < (h + 1):
	i = (2*"#") + a*"#"
	print i
	a += 1


