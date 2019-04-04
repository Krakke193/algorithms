func fibonacci(_ n: Int) -> Int {
    if n < 2 {
        return 1
    } else {
        return fibonacci(n - 2) + fibonacci(n - 1)
    }
}

let n = 4
let res = fibonacci(n)
print("\(n)th fibonacci number is: \(res)")
