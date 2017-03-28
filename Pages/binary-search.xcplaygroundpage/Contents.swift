//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

var str = "Hello, playground"

func binarySearch<Type: Comparable>(_ array: [Type], key: Type, range: Range<Int>) -> Int? {

	guard range.lowerBound < range.upperBound else { return nil }

	let middleIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2

	if array[middleIndex] > key {
		return binarySearch(array, key: key, range: range.lowerBound ..< middleIndex)
	} else if array[middleIndex] < key {
		return binarySearch(array, key: key, range: middleIndex + 1 ..< range.upperBound)
	} else {
		return middleIndex
	}

}

let array = [1, 3, 3, 5, 21, 54, 1, 30, 5, 10, 5].sorted()

binarySearch(array, key: 21, range: 0 ..< array.count)

