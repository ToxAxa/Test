//
//  CommentModel.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import Foundation

struct CommentModel: Codable {
    let id: Int
    let name: String
    let email: String
    let body: String

    enum CodingKeys: String, CodingKey {
        case id, name, email, body
    }
}
