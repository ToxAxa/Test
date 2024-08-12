//
//  UIViewController+Extension.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 10.08.2024.
//

import UIKit

extension UIViewController : StoryboardIdentifiable { }

extension UIViewController {
    
    class func instantiate(from storyboard: UIStoryboard) -> Self {
        return instantiate(from: storyboard, indentifier: String(describing: self))
    }
    
    class func instantiate() -> Self {
        let className = String(describing: self)
        return instantiate(from: UIStoryboard(name: className, bundle: Bundle(for: self)), indentifier: className)
    }
    
    class func instantiate<T: UIViewController>(from storyboard: UIStoryboard, indentifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: indentifier) as! T
    }
}
