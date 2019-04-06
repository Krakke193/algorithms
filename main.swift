var small = [5,6,2,9,7]
var big = (1...42).shuffled()
var text = (97...122)
	.map({Character(UnicodeScalar($0))})
	.shuffled()

big.mergeSort()
