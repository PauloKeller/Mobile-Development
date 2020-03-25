import Foudation

protocol Taggable {
  var tag: String { get }
  var data: Data { get }
  init(tag: String, data: Data)
}

protocol TaggedPersistable: Taggable, CustomStringConvertible, Equatable {
  init(tag: String, contentsOf url: URL) throws
  func persist(to url: URL) throws
}

protocol TaggedEncodable: Taggable {
  var base64: String { get }
}

struct MyData: Taggable {
  var tag: String
  
  var data: Data

  init (tag: String, data: Data) {
    self.tag = tag
    self.data = data
  } 
}

extension MyData: CustomStringConvertible {
  var description: String {
    return "MyData(\(tag))"
  }
}

extension MyData: TaggedEncodable {
  var base64: String {
    return self.data.base64EncodedString()
  }
}

extension MyData: TaggedPersistable {
  init(tag: String, contentsOf url: URL) throws {
    let date = try Data.init(contentsOf: url)
    self.init(tag: tag, data: data)
  }

  func persist(to url: URL) throws {
    try self.data.write(to: url)
  }
}