//
//  ReusableNibProvider.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 10.08.2024.
//

import UIKit


typealias ReusableNibProvider = ReuseIdentifiable & NibProvidable

// MARK: - ReuseIdentifiable
protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

// MARK: - NibProvidable
protocol NibProvidable: AnyObject {
    static var nibName: String { get }
    static var nib: UINib { get }
}

extension NibProvidable {
    static var nibName: String { "\(self)" }
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        return "\(self)"
    }
}
