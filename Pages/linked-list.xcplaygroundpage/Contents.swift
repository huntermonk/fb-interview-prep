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
        guard var node = head else { return nil }
        while case let next? = node.next {
            node = next
        }
        return node
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

	func makeSingly() {
		var node = head
		print("head \(head?.value).")
		while let next = node?.next {
			next.previous = nil
			node = next
			print("Node next: \(node?.next?.value).")
		}
	}

	func reverseSingly() -> Node<T>? {
		var node = head
		while let current = node {
			node = current.next
			swap(&current.next, &current.previous)
			node?.previous = nil
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

//let original = list.description
//list.reverse()
//list.description

list
list.makeSingly()
list

//: # Singly Linked List

enum SinglyLinkedList<Element> {
	indirect case list(Element, SinglyLinkedList<Element>)
	case empty

	func reversed() -> SinglyLinkedList<Element> {

		func reversed(input: SinglyLinkedList<Element>, output: SinglyLinkedList<Element>) -> SinglyLinkedList<Element> {
			switch input {
			case .empty:
				return output
			case let .list(head, tail):
				return reversed(input: tail, output: .list(head, output))
			}
		}

		return reversed(input: self, output: .empty)
	}
}

let foo = SinglyLinkedList.list(1, .list(2, .list(3, .list(4, .empty))))
let oof = foo.reversed()
switch oof {
case .list(4, .list(3, .list(2, .list(1, .empty)))):
	print("Reversed!")
default:
	print("Oops.")
}


//: [Next](@next)
