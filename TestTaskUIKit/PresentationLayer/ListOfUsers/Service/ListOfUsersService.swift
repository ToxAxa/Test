//
//  ListOfUsersService.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import Foundation

protocol ListOfUsersServiceAPIProtocol {
    func fetchUsers(completion: @escaping ResultCallback<[UserModel], AppError>)
}

final class ListOfUsersService {
    
    // MARK: Private proporties
    private let httpService: HttpService
    static let shared: ListOfUsersService = ListOfUsersService()
    
    // MARK: - Initialization
    init(httpService: HttpService = HttpService()) {
        self.httpService = httpService
    }
}

extension ListOfUsersService: ListOfUsersServiceAPIProtocol{
    
    func fetchUsers(completion: @escaping ResultCallback<[UserModel], AppError>) {
        do {
            try ListOfUsersHttpRouter.fetchUsers.request(usingHttpService: httpService) { result in
                switch result {
                case .success(let data):
                    guard let model: [UserModel] = DecoderHelper.decode(data: data, model: [UserModel].self) else {
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
