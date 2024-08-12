//
//  ListOfUsersHttpRouter.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import Foundation

enum ListOfUsersHttpRouter {
    case fetchUsers
}

extension ListOfUsersHttpRouter: HttpRouter {
    var path: String {
        switch self {
        case .fetchUsers:
            return "users"
        }
    }
    
    var method: HTTPMethods {
        switch self {
        case .fetchUsers:
            return .get
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json; charset=UTF-8"]
    }
    
    var parametrs: [String : Any]? {
        switch self {
        case .fetchUsers:
            return nil
        }
    }
    
    func body() throws -> Data? {
        return nil
    }
}
