//: [Previous](@previous)

//: # Quicksort
//: ## [IN PROGRESS]

import Foundation

func quickSort<T: Comparable>(_ array: [T]) -> [T] {
	guard array.count > 1 else { return array }

	let pivot = array[array.count / 2]
	let less = array.filter { $0 < pivot }
	let equal = array.filter { $0 == pivot }
	let more = array.filter { $0 > pivot }

	return quickSort(less) + equal + quickSort(more)
}

var array = [10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26]

quickSort(array)

//: This first example works and is easy to understand, but we filter over the array three times. There has to be a more efficient way to do this.

func partitionLomuto<T: Comparable>(_ array: inout [T], low: Int, high: Int) -> Int {
	let pivot = array[high]

	var i = low
	for j in low..<high {
		if array[j] <= pivot {
			(array[i], array[j]) = (array[j], array[i])
			i += 1
		}
	}

	(array[i], array[high]) = (array[high], array[i])
	return i
}

func quicksortLomuto<T: Comparable>(_ array: inout [T], low: Int, high: Int) {
	if low < high {
		let partition = partitionLomuto(&array, low: low, high: high)
		print("Partition: \(partition).")
		quicksortLomuto(&array, low: low, high: partition - 1)
		quicksortLomuto(&array, low: partition + 1, high: high)
	}
}

quicksortLomuto(&array, low: 0, high: array.count - 1)

//: [Next](@next)