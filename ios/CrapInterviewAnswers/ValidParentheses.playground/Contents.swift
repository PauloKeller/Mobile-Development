import UIKit

let couples = [("(",")"), ("{","}"), ("[","]")]

func isValid(s: String) -> Bool {
  var stack = [Character]()
  for c in s {
    if isStart(c: c) {
      stack.append(c)
    } else if isEnd(c: c) {
      guard let start = stack.popLast() else { return false } // no leading start
      for couple in couples {
        if couple.0 == String(start) {
          guard couple.1 == String(c) else { return false } // incorrect couple
          break
        }
      }
    } else {
      fatalError("Unknown character")
    }
  }
  
  return stack.isEmpty
}

private func isStart(c: Character) -> Bool {
  for couple in couples {
    if couple.0 == String(c) {
      return true
    }
  }
  return false
}

private func isEnd(c: Character) -> Bool {
  for couple in couples {
    if couple.1 == String(c) {
      return true
    }
  }
  return false
}

let s = "(}"


let result = isValid(s: s)
print(result)
