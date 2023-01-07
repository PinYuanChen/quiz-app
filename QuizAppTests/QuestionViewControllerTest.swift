//
// Created on 2023/1/7.
//

import UIKit
import XCTest
@testable import QuizApp

final class QuestionViewControllerTest: XCTestCase {

    func test_viewDidLoad_renderQuestionHeaderText() {
        let sut = QuestionViewController(question: "Q1", options: [])
        
        _ = sut.view
        
        XCTAssertEqual(sut.headerLabel.text, "Q1")
    }

    func test_viewDidLoad_withNoOptions_renderZeroOptions() {
        let sut = QuestionViewController(question: "Q1", options: [])

        _ = sut.view

        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    
    func test_viewDidLoad_withOneOption_renderOneOption() {
        let sut = QuestionViewController(question: "Q1", options: ["A1"])

        _ = sut.view

        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    func test_viewDidLoad_withOneOption_renderOneOptionText() {
        let sut = QuestionViewController(question: "Q1", options: ["A1"])

        _ = sut.view
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: indexPath)
        
        XCTAssertEqual(cell?.textLabel?.text, "A1")
    }
}