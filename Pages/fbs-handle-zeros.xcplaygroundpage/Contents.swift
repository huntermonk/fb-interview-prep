//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/*: Given an array, implement methods that:
1. Returns number of non-zero elements
2. Moves non-zero elements to beginning of array
*/

var array = [1, 0, 2, 0, 0, 3, 4]

let count = array.filter({ $0 == 0}).count
print(count)

let sorted = array.sorted()

func pushZeroesToEnd(array: inout [Int], numberOfZeroes: Int) {
	for (index, number) in array.enumerated() {
		if number == 0 {
			array.remove(at: index)

		}
	}
}

pushZeroesToEnd(array: &array, numberOfZeroes: count)