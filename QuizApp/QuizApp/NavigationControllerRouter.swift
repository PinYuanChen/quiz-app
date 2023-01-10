//
// Created on 2023/1/10.
//

import UIKit
import QuizEngine

class NavigationControllerRouter: Router {
    
    private let navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func routeTo(question: String, answerCallback: @escaping (String) -> Void) {
        navigationController.pushViewController(.init(), animated: false)
    }
    
    func routeTo(result: Result<String, String>) {
        
    }
}
