//
// Created on 2023/1/7.
//

import UIKit
import XCTest
@testable import QuizApp

final class QuestionViewControllerTest: XCTestCase {

    func test_viewDidLoad_renderQuestionHeaderText() {
        XCTAssertEqual(makeSUT(options: []).headerLabel.text, "Q1")
    }

    func test_viewDidLoad_render_Options() {
        XCTAssertEqual(makeSUT(options: []).tableView.numberOfRows(inSection: 0), 0)
        XCTAssertEqual(makeSUT(options: ["A1"]).tableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(makeSUT(options: ["A1", "A2"]).tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_viewDidLoad_withOneOption_renderOneOptionText() {
        let sut = makeSUT(options: ["A1"])

        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: indexPath)
        
        XCTAssertEqual(cell?.textLabel?.text, "A1")
    }
    
    // MARK: Helpers
    func makeSUT(question: String = "", options: [String]) -> QuestionViewController {
        let sut = QuestionViewController(question: question, options: options)

        _ = sut.view
        return sut
    }
}
