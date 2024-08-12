//
//  ListOfPostsBuilder.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 10.08.2024.
//

import UIKit

enum ListOfPostsBuilder {
    static func build() -> UIViewController {
        
        let storyboard = UIStoryboard(storyboard: .ListOfPosts)
        let view: ListOfPostsViewController = storyboard.instantiateViewController()
        let interactor = ListOfPostsInteractor(service: CharactersListService.shared)
        let router = ListOfPostsRouter(view: view)
        let presenter = ListOfPostsPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
}
