import XCTest
import SwiftTreeSitter
import TreeSitterTimur

final class TreeSitterTimurTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_timur())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading timur grammar")
    }
}
