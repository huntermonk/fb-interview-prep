//: [Previous](@previous)

//: # Linked List

import Foundation

class Node<T> {
	var value: T
	var next: Node?
	weak var previous: Node?

	init(_ value: T) {
		self.value = value
	}
}

class LinkedList<T> {
	fileprivate var head: Node<T>?

	var first: Node<T>? {
		return head
	}

	var last: Node<T>? {
		if var node = head {
			while case let next? = node.next {
				node = next
			}
			return node
		} else {
			return nil
		}
	}

	func append(_ value: T) {
		let new = Node(value)
		if let last = self.last {
			new.previous = last
			last.next = new
		} else {
			head = new
		}
	}

	func reverse() -> Node<T>? {
		var node = head
		while let current = node {
			node = current.next
			swap(&current.next, &current.previous)
			head = current
		}
		return head
	}
}

extension LinkedList: CustomStringConvertible {
	var description: String {
		var string = "["
		var node = head
		while let casted = node {
			string += "\(casted.value)"
			node = casted.next
			if node != nil { string += ", " }
		}
		return string + "]"
	}
}

let list = LinkedList<Int>()

list.append(13)
list.append(19)
list.append(3)
//list.append(24)
//list.append(0)
//list.append(8)
//list.append(1)

let original = list.description
list.reverse()
list.description

//: [Next](@next)