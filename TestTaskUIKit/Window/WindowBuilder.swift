//
//  WindowBuilder.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 10.08.2024.
//

import UIKit

enum WindowBuilder {
    static func build() -> UIWindow {
        let window = Window(frame: UIScreen.main.bounds)
        let router = WindowRouter(window: window)
        let _ = WindowPresenter(router: router)

        return window
    }
}
