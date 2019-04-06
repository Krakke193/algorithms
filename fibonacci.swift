// TODO: Add dynamic programming example

func fibonacci(_ n: Int) -> Int {
    if n < 2 {
        return 1
    } else {
        return fibonacci(n - 2) + fibonacci(n - 1)
    }
}
