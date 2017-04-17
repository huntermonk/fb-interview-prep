import Foundation

//: ## Big-o notation: Fibonacci

func printUnorderedPairs(array: [Int]) {
	for index in 0..<array.count {
		for jIndex in (index + 1)..<array.count {
			print("(\(index), \(jIndex))")
		}
	}
}

//printUnorderedPairs(array: [1,2,3,4,5,6,7,8,9,10])

func fib(_ n: Int) -> Int {
	if n <= 0 { return 0 }
	if n == 1 { return 1 }
	return fib(n - 1) + fib(n - 2)
}

//fib(4)

func allFib(_ n: Int) {
	for index in 1..<n {
		print("The \(index) fibonacci number is: \(fib(index)).")
	}
}

//allFib(4)

func allFibMemo(_ n: Int) {
	var memo = [Int : Int]()
	for index in 1..<n {
		print("The \(index) fibonacci number is: \(fib(index, memo: &memo)).")
	}
}

func fib(_ n: Int, memo: inout [Int : Int]) -> Int {
	if n <= 0 { return 0 }
	if n == 1 { return 1 }
	if let integer = memo[n] {
		return integer
	}
	memo[n] = fib(n - 1, memo: &memo) + fib(n - 2, memo: &memo)
	return memo[n]!
}

//allFibMemo(10)

func powersOf2(n: Int) -> Int {
    if n < 1 {
        return 0
    } else if n == 1 {
        print(n)
        return 1
    } else {
        let previous = powersOf2(n: n / 2)
        let current = previous * 2
        print(current)
        return current
    }
}

func power(_ a: Int, to: Int) -> Int {
    if to < 0 {
        return 0
    } else if to == 0 {
        return 1
    } else {
        return a * power(a, to: to - 1)
    }
}

func nonRecursivePower(_ a: Int, to: Int) -> Int {
    var value = 1
    for _ in 1...to {
        value *= a
    }
    return value
}

//power(2, to: 3)

//nonRecursivePower(2, to: 3)

//powersOf2(n: 100)

func sumDigits(_ n: Int) -> Int {
    var sum = 0
    var copy = n
    while copy > 0 {
        print("While loop begin with copy == \(copy).")
        sum += copy % 10
        copy /= 10
    }
    return sum
}

//sumDigits(145)

var numberOfAlphabet = 26
let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

func printSortedStrings(remaining: Int) {
    printSortedStrings(remaining: remaining, prefix: "")
}

func printSortedStrings(remaining: Int, prefix: String) {
    if remaining == 0 {
        if isInOrder(prefix) {
            print(prefix)
        }
    } else {
        for index in 0..<numberOfAlphabet {
            let c = ithLetter(index)
            printSortedStrings(remaining: remaining - 1, prefix: prefix + c)
        }
    }
}

func isInOrder(_ string: String) -> Bool {
    let sorted = string.characters.sorted().map({ String($0) }).reduce("", { "\($0.0)\($0.1)" })
    return string == sorted
}

func ithLetter(_ index: Int) -> String {
    return alphabet[index]
}

printSortedStrings(remaining: 2)
2 * (26*26)


//: [Next](@next)




