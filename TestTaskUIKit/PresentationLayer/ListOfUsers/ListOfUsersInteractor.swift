//
//  ListOfUsersInteractor.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import Foundation

protocol ListOfUsersInteractorProtocol {
    func fetchUsers(completion: @escaping ResultCallback<[UserModel], AppError>)
}

final class ListOfUsersInteractor {
    
    // MARK: - Private Properties
    private let service: ListOfUsersServiceAPIProtocol
    
    // MARK: - Initialization
    init(service: ListOfUsersServiceAPIProtocol) {
        self.service = service
    }
}

extension ListOfUsersInteractor: ListOfUsersInteractorProtocol {
    
    func fetchUsers(completion: @escaping ResultCallback<[UserModel], AppError>) {
        service.fetchUsers() { result in
            switch result {
            case .success(let users):
                completion(.success(users))
            case .failure(let errorString):
                completion(.failure(errorString))
            }
        }
    }
}
