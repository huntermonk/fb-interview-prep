//: [Previous](@previous)

//: ## Binary Tree

import Foundation

indirect enum BinaryTree<T> {
	case node(BinaryTree<T>, T, BinaryTree<T>)
	case empty

	var count: Int {
		switch self {
		case let .node(left, _, right):
			return left.count + 1 + right.count
		case .empty:
			return 0
		}
	}

	func inOrderArray(memo: inout [T]) -> [T] {
		guard case let .node(left, value, right) = self else { return memo }

		left.inOrderArray(memo: &memo)
		memo.append(value)
		right.inOrderArray(memo: &memo)
		return memo
	}

	func traverseInOrder(memo: inout [T], process: (T, _ memo: [T]) -> Void) {
		guard case let .node(left, value, right) = self else { return }
		left.traverseInOrder(memo: &memo, process: process)
		memo.append(value)
		process(value, memo)
		right.traverseInOrder(memo: &memo, process: process)
	}

	func traverseInOrder(process: (T) -> Void) {
		guard case let .node(left, value, right) = self else { return }
		left.traversePreOrder(process: process)
		process(value)
		right.traversePreOrder(process: process)
	}

	func traversePreOrder(process: (T) -> Void) {
		guard case let .node(left, value, right) = self else { return }
		process(value)
		left.traversePreOrder(process: process)
		right.traversePreOrder(process: process)
	}

	func traversePostOrder(process: (T) -> Void) {
		guard case let .node(left, value, right) = self else { return }
		left.traversePostOrder(process: process)
		right.traversePostOrder(process: process)
		process(value)
	}
}

let y = BinaryTree.node(.empty, "y", .empty)
let n = BinaryTree.node(y, "n", .empty)
let a = BinaryTree.node(n, "a", .empty)

let m = BinaryTree.node(.empty, "m", .empty)
let o = BinaryTree.node(m, "o", .empty)

let top = BinaryTree.node(a, "m", o)

extension BinaryTree: CustomDebugStringConvertible {
	var debugDescription: String {
		switch self {
		case let .node(left, value, right):
			return "value: \(value), left = [\(left.debugDescription)], right = [\(right.debugDescription)]"
		case .empty:
			return ""
		}
	}
}

top.traverseInOrder { node in
	print("In order: \(node).")
}

var memo = [String]()
let inOrder = top.inOrderArray(memo: &memo)

print("\n")

top.traversePreOrder { node in
	print("Pre order: \(node).")
}

print("\n")

top.traversePostOrder { node in
	print("Post order: \(node).")
}

//: [Next](@next)