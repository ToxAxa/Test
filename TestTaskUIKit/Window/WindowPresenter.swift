//
//  WindowPresenter.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 10.08.2024.
//

import Foundation

protocol WindowPresentationProtocol {
    func routeToView()
}

class WindowPresenter {
    
    // MARK: Private proporties
    private let router: WindowRoutingProtocol
    
    // MARK: Initialization
    init(router: WindowRoutingProtocol) {
        self.router = router
        
        routeToView()
    }
}

extension WindowPresenter: WindowPresentationProtocol {
    func routeToView() {
        self.router.routeToView()
    }
}
