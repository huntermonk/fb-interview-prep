//: [Previous](@previous)

import Foundation

//: [Next](@next)

//: [From](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Binary%20Search%20Tree)

enum Child {
	case left, right
}

class BinarySearchTree<T: Comparable> {
	private(set) var value: T
	private(set) var parent: BinarySearchTree?
	private(set) var left: BinarySearchTree?
	private(set) var right: BinarySearchTree?

	init(_ value: T) {
		self.value = value
	}

	convenience init(array: [T]) {
		precondition(array.count > 0)
		self.init(array: array)
		for value in array.dropFirst() {
			insert(value)
		}
	}

	var isRoot: Bool {
		return parent == nil
	}

	var isLeaf: Bool {
		return left == nil && right == nil
	}

	func isChild(_ direction: Child) -> Bool {
		switch direction {
		case .left: return parent?.left === self
		case .right: return parent?.right === self
		}
	}

	func hasChild(_ direction: Child) -> Bool {
		switch direction {
		case .left: return left != nil
		case .right: return right != nil
		}
	}

	var hasAnyChild: Bool {
		return !isLeaf
	}

	var hasBothChildren: Bool {
		return hasChild(.left) && hasChild(.right)
	}

	var count: Int {
		return (left?.count ?? 0) + 1 + (right?.count ?? 0)
	}

	func insert(_ value: T) {
		if value < self.value {
			if let left = left {
				left.insert(value)
			} else {
				left = BinarySearchTree(value)
				left?.parent = self
			}
		} else {
			if let right = right {
				right.insert(value)
			} else {
				right = BinarySearchTree(value)
				right?.parent = self
			}
		}
	}
}