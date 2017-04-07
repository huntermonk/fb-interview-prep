//: [Previous](@previous)

import Foundation

class Node<T> {
    var value: T
    var next: Node?
    
    init(_ value: T) {
        self.value = value
    }
}

class LinkedList<T> {
	fileprivate var head: Node<T>?
   
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
			last.next = new
		} else {
			head = new
		}
	}
    
    func reverse() {
        var node = head
        while let current = node {
            node = current.next
            node?.next = current
        }
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

list.append(3)
list.append(10)
list.append(1)

list.description

//: [Next](@next)
