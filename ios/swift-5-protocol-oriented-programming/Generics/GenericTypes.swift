import Foundation

struct StringWrapper {
  var storage: String
}

struct IntWrapper {
  var storage: Int
}

struct DateWrapper {
  var storage: Date
}

struct Wrapper<T> {
  var storage: T

  init(_ value: T) {
    storage = value
  }
}

let piWrapped = Wrapper(Double.pi) // Wrapper<Double>(Double.pi)

let stringWrapper = Wrapper("POP")

let dateWrapper = Wrapper(Date())