//
//  ListOfCommentsRouter.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import UIKit

protocol ListOfCommentsRoutingProtocol {
    
}

final class ListOfCommentsRouter {
    
    // MARK: - Private properties
    private let view: UIViewController
    
    // MARK: - Initialization
    init(view: UIViewController) {
        self.view = view
    }
}

extension ListOfCommentsRouter: ListOfCommentsRoutingProtocol {
    
}
