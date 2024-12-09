//
//  TestJenkinsTests.swift
//  TestJenkinsTests
//
//  Created by Shashikant Suryakant Bhadke on 09/12/24.
//

import Testing
@testable import TestJenkins

struct ViewModelTests {

    @Test func viewModelInit() async throws {
        let viewModel = ViewModel()
        #expect(viewModel.index.value == 0)
    }
    
    @Test func add() async throws {
        let viewModel = ViewModel()
        #expect(viewModel.index.value == 0)
        viewModel.add()
        #expect(viewModel.index.value == 1)
    }
    
    @Test func remove() async throws {
        let viewModel = ViewModel()
        #expect(viewModel.index.value == 0)
        viewModel.add()
        #expect(viewModel.index.value == 1)
        viewModel.remove()
        #expect(viewModel.index.value == 0)
    }
}
