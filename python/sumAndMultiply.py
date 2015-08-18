#finish -  
#aFunctionWhichTakesTwoListsOfStringsOfNumbers
#AndAddsThemUp
#AndThenMultiplysTheTwoSums
#AndMakesItEqualToResult

s1 = [1,2,3,4]
s2 = [1,2,3,4]


def sumAndMultiplyLists(s1,s2):
	total1 = 0
	total2 = 0
	for num in s1:
		total1 += num
	for num in s2:
		total2 += num
	result = total1*total2
	return result 
result = sumAndMultiplyLists(s1,s2)
print result