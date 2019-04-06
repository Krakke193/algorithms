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

    mutating func mergeSort() {

        func sort(_ arr: Array) -> Array {
            guard arr.count > 1 else { return arr }

            let middle = arr.count / 2
            let left = sort(Array(arr[0..<middle]))
            let right = sort(Array(arr[middle..<arr.count]))

            return merge(l: left, r: right)
        }

        func merge(l left: Array, r right: Array) -> Array {
            var leftIndex = 0
            var rightIndex = 0

            var merged = [Element]()
            merged.reserveCapacity(left.count + right.count)

            while leftIndex < left.count && rightIndex < right.count {
                if left[leftIndex] < right[rightIndex] {
                    merged.append(left[leftIndex])
                    leftIndex += 1
                } else if left[leftIndex] > right[rightIndex] {
                    merged.append(right[rightIndex])
                    rightIndex += 1
                } else {
                    // elements are equal – add both and increase indexes
                    merged.append(left[leftIndex])
                    merged.append(right[rightIndex])

                    leftIndex += 1
                    rightIndex += 1
                }
            }

            // some elements may be left in either left or right array
            while leftIndex < left.count {
                merged.append(left[leftIndex])
                leftIndex += 1
            }

            while rightIndex < right.count {
                merged.append(right[rightIndex])
                rightIndex += 1
            }

            return merged
        }

        self = sort(self)
        print(self)
    }
}



var small = [5,6,2,9,7]
var big = (1...42).shuffled()
var text = (97...122)
    .map({Character(UnicodeScalar($0))})
    .shuffled()

big.mergeSort()
