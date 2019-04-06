extension Array where Element: Comparable {
	mutating func bubbleSort() {
		for i in 0..<self.count {
			for j in 1..<self.count - i {
				if self[j - 1] > self[j] {
					self.swapAt(j - 1, j)
				}
			}
		}

		print(self)
	}

	mutating func insertionSort() {
		for var i in 1..<self.count {
			let temp = self[i]
			while i > 0 && temp < self[i - 1] {
				self[i] = self[i-1]
				i -= 1
			}
			self[i] = temp
		}

		print(self)
	}
}



var small = [5,6,2,9]
var big = [5,6,2,9,5,7,1,0,2,4,9]
var text = ["z", "a", "x", "c", "t"]

big.bubbleSort()
