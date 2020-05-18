import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Classes_and_ObjectsTests.allTests),
    ]
}
#endif
