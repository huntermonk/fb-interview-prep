//: [Previous](@previous)

import Foundation

func printUnorderedPairs(array: [Int]) {
	for index in 0..<array.count {
		for jIndex in (index + 1)..<array.count {
			print("(\(index), \(jIndex))")
		}
	}
}

printUnorderedPairs(array: [1,2,3,4,5,6,7,8,9,10])

func test() {
	for i in 0..<10 {
		print(i)
	}
}

//test()

//: [Next](@next)

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

allFibMemo(10)

