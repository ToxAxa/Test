//
//  ListOfUsersRouter.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import UIKit

protocol ListOfUsersRoutingProtocol {
    func showPostsScreen(with user: UserModel)
}

final class ListOfUsersRouter {
    // MARK: - Private properties
    private let view: UIViewController
    private let callback: UserCallback
    
    // MARK: - Initialization
    init(view: UIViewController, callback: @escaping (UserModel) -> Void) {
        self.view = view
        self.callback = callback
    }
}

extension ListOfUsersRouter: ListOfUsersRoutingProtocol {
    func showPostsScreen(with user: UserModel) {
        callback(user)
        view.navigationController?.popViewController(animated: true)
    }
}
