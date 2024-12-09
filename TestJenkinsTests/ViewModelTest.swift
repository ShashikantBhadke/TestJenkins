import XCTest
@testable import TestJenkins

final class ViewModelTest: XCTestCase {
    func testInitMethod() {
        let viewModel = ViewModel()
        XCTAssertEqual(viewModel.index.value, 0)
    }
    func testAddMethod() {
        let viewModel = ViewModel()
        XCTAssertEqual(viewModel.index.value, 0)
        viewModel.add()
        XCTAssertEqual(viewModel.index.value, 1)
    }
    func testRemoveMethod() {
        let viewModel = ViewModel()
        XCTAssertEqual(viewModel.index.value, 0)
        viewModel.add()
        XCTAssertEqual(viewModel.index.value, 1)
        viewModel.remove()
        XCTAssertEqual(viewModel.index.value, 0)
    }
}
