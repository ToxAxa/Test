//
//  WindowRouter.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 10.08.2024.
//

import UIKit

protocol WindowRoutingProtocol {
    func routeToView()
}

class WindowRouter: WindowRoutingProtocol {
    
    // MARK: Private proporties
    private let window: UIWindow

    // MARK: Initialization
    init(window: UIWindow) {
        self.window = window
    }
}

extension WindowRouter {
    
    //MARK: Route to Login or Registration or Create some navigation configurator
    func routeToView() {
        self.window.rootViewController = configurateNavigation()
        self.window.tintColor = .white
        self.window.makeKeyAndVisible()
    }
    
    func configurateNavigation() -> UIViewController {
        let view = ListOfPostsBuilder.build()
        let navigationVC = UINavigationController(rootViewController: view)
        
        let navigationBarAppearance = UINavigationBarAppearance()
        let backButtonAppearance = UIBarButtonItemAppearance(style: .plain)
        navigationBarAppearance.backgroundColor = #colorLiteral(red: 0.1134429052, green: 0.1134429052, blue: 0.1134429052, alpha: 1)
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        navigationBarAppearance.backButtonAppearance = backButtonAppearance
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance

        return navigationVC
    }
}

