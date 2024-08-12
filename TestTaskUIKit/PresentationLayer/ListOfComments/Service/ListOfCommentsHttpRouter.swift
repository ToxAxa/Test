//
//  ListOfCommentsHttpRouter.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import Foundation

enum ListOfCommentsHttpRouter {
    case fetchCommentsList(postId: Int)

}

extension ListOfCommentsHttpRouter: HttpRouter {
    var path: String {
        switch self {
        case .fetchCommentsList:
            return "comments"
        }
    }
    
    var method: HTTPMethods {
        return .get
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json; charset=UTF-8"]
    }
    
    var parametrs: [String : Any]? {
        switch self {
        case .fetchCommentsList(let postId):
            return ["postId": postId]
        }
    }
    
    func body() throws -> Data? {
        return nil
    }
}
