//: [Previous](@previous)

//: # Hash Table

import Foundation

struct HashTable<Key: Hashable, Value> {
	private typealias Element = (key: Key, value: Value)
	private typealias Bucket = [Element]
	private var buckets: [Bucket]

	private(set) var count = 0

	var isEmpty: Bool { return count == 0 }

	init(capacity: Int) {
		assert(capacity > 0)
		buckets = [Bucket](repeating: [], count: capacity)
	}

	private func index(forKey key: Key) -> Int {
		return abs(key.hashValue) % buckets.count
	}

	subscript(key: Key) -> Value? {
		get {
			return value(forKey: key)
		}
		set {
			if let value = newValue {
				update(value: value, forKey: key)
			} else {
				remove(forKey: key)
			}
		}
	}

	var overloaded: Bool {
		return (count * 100) / (buckets.count) >= 75
	}

	/*
	MARK: Getters and setters
	*/

	private func findElement(key: Key, index: Int) -> (element:Element, innerIndex: Int)? {
		for (i, element) in buckets[index].enumerated() {
			if element.key == key {
				return (element, i)
			}
		}
		return nil
	}

	func value(forKey key: Key) -> Value? {
		let index = self.index(forKey: key)

		if let tuple = findElement(key: key, index: index) {
			return tuple.element.value
		}

		return nil
	}

	mutating func update(value: Value, forKey key: Key) -> Value? {
		let index = self.index(forKey: key)

		if let found = findElement(key: key, index: index) {
			let old = found.element.value
			buckets[index][found.innerIndex].value = value
			return old
		}

		append(key: key, value: value, index: index)
		return nil
	}

	private mutating func append(key: Key, value: Value, index: Int) {
		buckets[index].append((key: key, value: value))
		count += 1
		if overloaded {
			resize()
		}
	}

	mutating func remove(forKey key: Key) -> Value? {
		let index = self.index(forKey: key)
		if let found = findElement(key: key, index: index) {
			buckets[index].remove(at: found.innerIndex)
			count -= 1
			return found.element.value
		}
		return nil
	}

	mutating func resize() {

	}

}

var table = HashTable<String, String>(capacity: 5)

table["dog"] = "fido"
table["cat"] = "snickers"

table.overloaded

//table.value(forKey: "dog")

table["we"] = "it's"
table["are"] = "time"
table["gonna"] = "to"
table["overload"] = "party"

table.overloaded

table.value(forKey: "we")

//: [Next](@next)