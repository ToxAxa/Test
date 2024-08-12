//
//  ListOfPostsInteractor.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 10.08.2024.
//

import Foundation

protocol ListOfPostsInteractorProtocol {
    func fetchPosts(completion: @escaping ResultCallback<[PostModel], AppError>)
    func fetchUser(completion: @escaping ResultCallback<UserModel, AppError>)
    func updateUser(user: UserModel)
}

final class ListOfPostsInteractor {
    
    // MARK: - Private Properties
    private let service: CharactersListServiceAPIProtocol
    private var currentUser: UserModel?
    
    // MARK: - Initialization
    init(service: CharactersListServiceAPIProtocol) {
        self.service = service
    }
}

extension ListOfPostsInteractor: ListOfPostsInteractorProtocol {
    func updateUser(user: UserModel) {
        currentUser = user
    }

    func fetchUser(completion: @escaping ResultCallback<UserModel, AppError>) {
        let id = currentUser?.id ?? 1
        
        service.fetchUser(userId: id) { [weak self] result in
            switch result {
            case .success(let user):
                self?.currentUser = user
                completion(.success(user))
            case .failure(let errorString):
                completion(.failure(errorString))
            }
        }
    }
    
    func fetchPosts(completion: @escaping ResultCallback<[PostModel], AppError>) {
        guard let user = currentUser else {return}
        service.fetchCharacters(userId: user.id) { result in
            switch result {
            case .success(let modelArray):
                completion(.success(modelArray))
            case .failure(let errorString):
                completion(.failure(errorString))
            }
        }
    }
}
