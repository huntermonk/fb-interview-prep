//: [Previous](@previous)

//: # Handle zeros
//: Facebook specific, taken from [Glassdoor questions.](https://www.glassdoor.com/Interview/Phone-interview-question-1-Given-an-array-for-example-1-0-2-0-0-3-4-implement-methods-that-1-return-QTN_1341991.htm)
import Foundation

/*: Given an array, implement methods that:
1. Returns number of non-zero elements
2. Moves non-zero elements to beginning of array
*/

var array = [1, 0, 2, 0, 9, 3, 4]

// [1, 0, 2, 0, 9, 3, 4]
// 1: Found non-zero, but i == index so no swap. index == 0, i == 1
// 2: Found 0, nothing happens. index == 1, i == 1
// 3: found 2. index == 2, i == 1. We swap 0 and 2. Increase i. ndex == 2, i == 2.
// [1, 2, 0, 0, 9, 3, 4]
// 4: Found 0 (array[3]), nothing happens. index == 3, i == 2.
// 5: Found 9. i == 2 and index == 4, so i is lower. That means we swap 9 and 0 from array[2]. ++i. index == 4, i == 3.
// [1, 2, 9, 0, 0, 3, 4]
// 6: Found 3. i == 3 and index == 5, so i is lower. That means we swap 3 and 0 from array[3]. ++i. index == 5, i == 4.
// [1, 2, 9, 3, 0, 0, 4]
// 7: Found 4. i == 4 and index == 6, so i is lower. That means we swap 4 and 0 from array[4]. ++i. index == 6, i == 5.
// [1, 2, 9, 3, 4, 0, 0]

func pushZerosToEnd(array: inout [Int]) {
	var zeroIndex = 0
	for (index, _) in array.enumerated() {
		print("Begin loop: \(array[index]).")
		if array[index] != 0 {
			print("Not zero: \(array[index])")
			if zeroIndex < index {
				print("About to swap \(array[zeroIndex]) and \(array[index]).")
				swap(&array[zeroIndex], &array[index])
			}
			zeroIndex += 1
		}
		print("\n")
	}
}

pushZerosToEnd(array: &array)

func bringZerosToFront(array: inout [Int]) {
	var nonZeroIndex = 0
	for (index, _) in array.enumerated() {
		if array[index] == 0 {
			if nonZeroIndex < index {
				swap(&array[nonZeroIndex], &array[index])
			}
			nonZeroIndex += 1
		}
	}
}

//: [Next](@next)