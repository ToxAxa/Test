//
//  PostModel.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 10.08.2024.
//

import Foundation

struct PostModel: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String

    enum CodingKeys: String, CodingKey {
        case userId, id, title, body
    }
}
