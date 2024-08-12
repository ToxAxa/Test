//
//  ListOfPostsHttpRouter.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import Foundation

enum PostsListHTTPRouter {
    case fetchPostsList(userId: Int)
    case fetchUsers(userId: Int)
}

extension PostsListHTTPRouter: HttpRouter {

    var path: String {
        switch self {
        case .fetchPostsList:
            return "posts"
        case .fetchUsers(userId: let id):
            return "users/\(id)"
        }
    }
    
    var method: HTTPMethods {
        switch self {
        case .fetchPostsList:
            return .get
        case .fetchUsers:
            return .get
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json; charset=UTF-8"]
    }
    
    var parametrs: [String : Any]? {
        switch self {
        case .fetchPostsList(userId: let id):
            return ["userId": id]
        case .fetchUsers:
            return nil
        }
    }
    
    func body() throws -> Data? {
        return nil
    }
}
