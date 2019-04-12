struct Heap<T> {
    var array = [T]()
    
    // For comparable data types, > makes a max-heap, < makes a min-heap.
    private var orderCriteria: (T, T) -> Bool
    
    
    // MARK: Index utilities
    private func parentIndex(forIndex i: Int) -> Int? {
        let index = (i - 1) / 2
        return index > 0 ? index : nil
    }
    
    private func leftChildIndex(forIndex i: Int) -> Int? {
        let index = 2*i + 1
        return index < array.count ? index : nil
    }
    
    private func rightChildIndex(forIndex i: Int) -> Int? {
        let index = 2*i + 2
        return index < array.count ? index : nil
    }
    
    
    // MARK: Initializers
    public init(orderCriteria: @escaping (T, T) -> Bool) {
        self.orderCriteria = orderCriteria
    }
    
    public init(array: [T], orderCriteria: @escaping (T, T) -> Bool) {
        self.array = array
        self.orderCriteria = orderCriteria
        configureHeap()
    }
    
    
    // MARK: Heap methods
    private mutating func configureHeap() {
        for i in stride(from: array.count / 2 - 1, through: 0, by: -1) {
            shiftDown(from: i)
        }
    }
    
    mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(forIndex: index)
        let rightChildIndex = self.rightChildIndex(forIndex: index)
        
        var shouldComeFirst = index
        if let leftIndex = leftChildIndex, 
           leftIndex < endIndex,
           orderCriteria(array[leftIndex], array[shouldComeFirst]) 
        {
            shouldComeFirst = leftIndex
        }
        if let rightIndex = rightChildIndex, 
           rightIndex < endIndex,
           orderCriteria(array[rightIndex], array[shouldComeFirst]) 
        {
            shouldComeFirst = rightIndex
        }
        // if nothing has changed and the parent element should come first just quit
        if shouldComeFirst == index { return }
        
        array.swapAt(shouldComeFirst, index)
        
        // continue to shiftDown the element until it reaches it's place
        shiftDown(from: shouldComeFirst, until: endIndex)
    }
    
    mutating func shiftDown(from index: Int) {
        shiftDown(from: index, until: array.count)
    }
    
    var sortedArray: [T] {
        var copy = self
        
        for i in stride(from: array.count - 1, through: 1, by: -1) {
            copy.array.swapAt(0, i)
            copy.shiftDown(from: 0, until: i)
        }
        
        return copy.array
    }
}

extension Heap: CustomStringConvertible {
    var description: String {
        return array.description
    }
}