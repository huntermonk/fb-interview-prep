//: [Previous](@previous)

import Foundation

let string = "Mr John Smith".characters.forEach{ $0.hashValue }

extension String {
    var urlified: String {
        var urlified = ""
        for character in characters {
            if character == " " {
                urlified.append("%20")
            } else {
                urlified.append(character)
            }
        }
        return urlified
    }
}

//: [Next](@next)
