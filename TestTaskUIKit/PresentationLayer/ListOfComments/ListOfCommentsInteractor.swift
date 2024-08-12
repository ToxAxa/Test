//
//  ListOfCommentsInteractor.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import Foundation

protocol ListOfCommentsInteractorProtocol {
    func fetchComments(completion: @escaping ResultCallback<[CommentModel], AppError>)
}

final class ListOfCommentsInteractor {
    // MARK: - Private Properties
    private let service: ListOfCommentsService
    private let postId: Int
    
    // MARK: - Initialization
    init(service: ListOfCommentsService, postId: Int) {
        self.service = service
        self.postId = postId
    }
}

extension ListOfCommentsInteractor: ListOfCommentsInteractorProtocol {
    
    func fetchComments(completion: @escaping ResultCallback<[CommentModel], AppError>) {
        service.fetchComments(postId: postId) { result in
            switch result {
            case .success(let modelArray):
                completion(.success(modelArray))
            case .failure(let errorString):
                completion(.failure(errorString))
            }
        }
    }
}
