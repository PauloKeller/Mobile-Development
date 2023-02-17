import Foundation

protocol Taggable {
  var tag: String { get set }
  var data: Data { get }
  static var counter: Int { get }

  mutating func update(data: Data) -> Bool
  static func incrementCounter()

  init(tag: String, data: Data)
}

struct TaggedData: Taggable {
  var tag: String
  var data: Data

  static var counter: Int = 0

  mutating func update(data:Data) -> Bool {
    self.data = data 
    return true
  }

  static func incrementCounter() {
    counter += 1
  }

  init(tag: String, data: Data) {
    self.tag = tag
    self.data = data
  }
}