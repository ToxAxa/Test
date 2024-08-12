//
//  Builder.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 12.08.2024.
//

import UIKit

protocol BuilderProtocol {
    func createPostModule() -> UIViewController
    func createCommentModule() -> UIViewController
}

//MARK: TODO
class ModuleBuilder: BuilderProtocol {
    func createPostModule() -> UIViewController {
        // presenter
        // interactor
        // router
        // ...
        return UIViewController()
    }
    
    func createCommentModule() -> UIViewController {
        // presenter
        // interactor
        // router
        // ...
        return UIViewController()
    }
}
