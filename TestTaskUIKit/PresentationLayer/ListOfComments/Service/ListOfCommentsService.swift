//
//  ListOfCommentsService.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import Foundation

protocol ListOfCommentsServiceAPIProtocol {
    func fetchComments(postId: Int, completion: @escaping ResultCallback<[CommentModel], AppError>)
}

class ListOfCommentsService {
    
    // MARK: Private proporties
    private let httpService: HttpService
    static let shared: ListOfCommentsService = ListOfCommentsService()
    
    // MARK: - Initialization
    init(httpService: HttpService = HttpService()) {
        self.httpService = httpService
    }
}

extension ListOfCommentsService: ListOfCommentsServiceAPIProtocol {
    func fetchComments(postId: Int, completion: @escaping ResultCallback<[CommentModel], AppError>) {
        do {
            try ListOfCommentsHttpRouter.fetchCommentsList(postId: postId).request(usingHttpService: httpService) { result in
                switch result {
                case .success(let data):
                    guard let model: [CommentModel] = DecoderHelper.decode(data: data, model: [CommentModel].self) else {
                        completion(.failure(.decoding))
                        return
                    }
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } catch let error {
            completion(.failure(.localizedError(localizedTitle: error.localizedDescription)))
        }
    }
    
    
}
