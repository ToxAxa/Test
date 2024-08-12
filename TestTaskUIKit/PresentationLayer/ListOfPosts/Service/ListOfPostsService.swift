//
//  Service.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 10.08.2024.
//

import Foundation

protocol CharactersListServiceAPIProtocol {
    func fetchCharacters(userId: Int, completion: @escaping ResultCallback<[PostModel], AppError>)
    func fetchUser(userId: Int, completion: @escaping ResultCallback<UserModel, AppError>)
}

class CharactersListService {
    
    // MARK: Private proporties
    private let httpService: HttpService
    static let shared: CharactersListService = CharactersListService()
    
    // MARK: - Initialization
    init(httpService: HttpService = HttpService()) {
        self.httpService = httpService
    }
}

extension CharactersListService: CharactersListServiceAPIProtocol {

    func fetchUser(userId: Int, completion: @escaping ResultCallback<UserModel, AppError>) {
        do {
            try PostsListHTTPRouter.fetchUsers(userId: userId).request(usingHttpService: httpService) { result in
                switch result {
                case .success(let data):
                    guard let model: UserModel = DecoderHelper.decode(data: data, model: UserModel.self) else {
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

    func fetchCharacters(userId: Int, completion: @escaping ResultCallback<[PostModel], AppError>) {
        do {
            try PostsListHTTPRouter.fetchPostsList(userId: userId).request(usingHttpService: httpService) { result in
                switch result {
                case .success(let data):
                    guard let model: [PostModel] = DecoderHelper.decode(data: data, model: [PostModel].self) else {
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
