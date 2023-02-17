import Foundation

protocol Encrypting {
  func xor(key: UInt8) -> Self?
}

extension  String: Encrypting {
  func xor(key: UInt8) -> String? {
    return String(bytes: self.utf8.map { $0 ^ key}, encoding: .utf8)
  }
}

let source = "Hello, Protocol!"

let target = source.xor(key: 42)

print(target ?? "Failed to encode")
print(target?.xor(key: 42) ?? "Failed to decode")