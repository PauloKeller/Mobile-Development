import UIKit

func callPoints(ops: [String]) -> Int {
  var sum = 0
  var temp = [Int]()
  var previous = 0
  
  for op in ops {
    switch op {
    case "C":
      temp.removeLast()
      if let last = temp.last {
        previous = last
      }
    case "D":
      temp.append(2 * previous)
    case "+":
      if let last = temp.last {
        temp.append(previous + last)
        previous = last
      }
    default:
      if let num = Int(op) {
        if let last = temp.last {
          previous = last
        }

        temp.append(num)
      }
    }
  }
  
  print(temp)
  
  sum = temp.reduce(0, +)
  return sum
}

//let ops = ["5", "2", "C", "D", "+"]
let ops = ["5", "-2", "4", "C", "D", "9", "+", "+"]

let result = callPoints(ops: ops)
print(result)
