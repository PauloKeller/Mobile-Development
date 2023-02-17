import Foundation

class TaggedData {
  var tag:String 
  var data: Data

  init(tag:String, data:Data) {
    self.tag = tag
    self.data = data
  }
}

class PersistentTaggedData: TaggedData {
  func persist(to url: URL): throws {
    let data = try self.data.write(to: url)
  }

  convenience init(tag: String, contentsOf url:URL) throws {
    let data = try Data(contentsOf: url)
    self.init(tag: tag, data: data)
  }
}

class TaggedDataWithEncoding: TaggedData {
  var base64EncodedString: String {
    return data.base64EncodedString()
  }
}