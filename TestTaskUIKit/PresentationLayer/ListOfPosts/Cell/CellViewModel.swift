//
//  PostViewModel.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import Foundation

final class CellViewModel: CellIdentifiable {
    let id: Int
    let title: String
    let description: String
    
    var cellIdentifier: String {
        "ReusableCell"
    }
    
    init(id: Int, title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
    }
}
