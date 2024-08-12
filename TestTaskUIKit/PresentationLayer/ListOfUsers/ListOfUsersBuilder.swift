//
//  ListOfUsersBuilder.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import UIKit
typealias UserCallback = ((UserModel) -> Void)

enum ListOfUsersBuilder {
    static func build(callback: @escaping UserCallback) -> UIViewController {
        
        let storyboard = UIStoryboard(storyboard: .ListOfUsers)
        let view: ListOfUsersViewController = storyboard.instantiateViewController()
        let interactor = ListOfUsersInteractor(service: ListOfUsersService.shared)
        let router = ListOfUsersRouter(view: view, callback: callback)
        let presenter = ListOfUsersPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
}
