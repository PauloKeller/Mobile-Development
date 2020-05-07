import Foundation

public protocol StackProtocol {
  associatedtype E

  mutating func push(_ item: E)
  mutating func pop() -> E?
  func peek() -> E?
  var count: Int { get }
  var isEmpty: Bool { get }
}

public struct Stack<T>: StackProtocol {
  private var storage = [T]()
  
  public mutating func push(_ item: T) {
    storage.append(item)
  }

  public mutating func pop() -> T? {
    storage.popLast()
  }

  public func peek() -> T? {
    storage.last
  }

  public var count: Int {
    storage.count
  }

  public var isEmpty: Bool {
    storage.isEmpty
  }
}

var stringStack = Stack<String>()

stringStack.push("Hello")
stringStack.push(", ")
stringStack.push("Swift!")

print(stringStack.pop() ?? "empty")
print(stringStack.pop() ?? "empty")
print(stringStack.peek() ?? "empty")
print(stringStack.count)