import Foundation

protocol Taggable {
  associatedtype Content: Equatable

  var tag: String { get }
  var data: Content { get }
  init(tag: String, data: Content) 
}

struct TaggedDouble: Taggable {
  var tag: String
  var data: Double
}

struct TaggedDate: Taggable {
  var tag: String
  var data: Date
}

struct GenericTagged<T: Equatable>: Taggable {
  var tag: String
  var data: T
}

let taggedDouble = GenericTagged<Double>(tag: "pi", data: Double.pi)