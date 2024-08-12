//
//  ListOfCommentsBuilder.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import UIKit

enum ListOfCommentsBuilder {
    static func build(postId: Int) -> UIViewController {
        let storyboard = UIStoryboard(storyboard: .ListOfComments)
        let view: ListOfCommentsViewController = storyboard.instantiateViewController()
        let interactor = ListOfCommentsInteractor(service: ListOfCommentsService.shared, postId: postId)
        let router = ListOfCommentsRouter(view: view)
        let presenter = ListOfCommentsPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
}
