//
//  ListOfPostsRouter.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 10.08.2024.
//

import UIKit

protocol ListOfPostsRoutingProtocol {
    func showCommentsScreen(with postId: Int)
    func showUsersList(callback: @escaping UserCallback)
}

final class ListOfPostsRouter {
    
    // MARK: - Private properties
    private let view: UIViewController
    
    // MARK: - Initialization
    init(view: UIViewController) {
        self.view = view
    }
}

extension ListOfPostsRouter: ListOfPostsRoutingProtocol {
    func showCommentsScreen(with postId: Int) {
        let vc = ListOfCommentsBuilder.build(postId: postId)
        view.navigationController?.pushViewController(vc, animated: true)
    }
    func showUsersList(callback: @escaping UserCallback) {
        let vc = ListOfUsersBuilder.build(callback: callback)
        view.navigationController?.pushViewController(vc, animated: true)
    }
}
