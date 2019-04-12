var small = [5,6,2,9,7]
var big = ((1...42) + [4, 5, 5, 5, 15, 15, 20, 42]).shuffled()
var text = (97...122)
	.map({Character(UnicodeScalar($0))})
	.shuffled()

//big.quickSort()
var heap = Heap(array: big, orderCriteria: >)
print(heap.sortedArray)
