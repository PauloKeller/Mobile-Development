import UIKit

let array = [1, 1, 2, 3, 4, 5, 6, 7, 7, 8, 9, 2, 3, 10, 0 ]

let largestNumber = array.max()

print(largestNumber!)

let smallestNumber = array.min()

print(smallestNumber!)

let duplicates = Array(Set(array.filter({ (i: Int) in array.filter({ $0 == i }).count > 1})))

print(duplicates)

let mappedItems = array.map { ($0, 1) }
let duplicatedCounts = Dictionary(mappedItems, uniquingKeysWith: +)

print(duplicatedCounts)
