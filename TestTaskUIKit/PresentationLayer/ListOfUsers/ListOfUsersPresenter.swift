//
//  ListOfUsersPresenter.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import Foundation

protocol ListOfUsersPresentationProtocol {
    func fetchUsers()
    func didTapCell(with index: IndexPath)
}

final class ListOfUsersPresenter {
    
    // MARK: Private proporties
    private weak var view: ListOfUsersViewProtocol?
    private let router: ListOfUsersRoutingProtocol
    private let interactor: ListOfUsersInteractorProtocol
    private var usersArray: [UserModel]?
    
    init(view: ListOfUsersViewProtocol?, router: ListOfUsersRoutingProtocol, interactor: ListOfUsersInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension ListOfUsersPresenter: ListOfUsersPresentationProtocol {

    func fetchUsers() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor.fetchUsers { result in
                switch result {
                case .success(let users):
                    self?.usersArray = users
                    let section = SectionViewModel()
                    users.forEach { section.rows.append(CellViewModel(id: $0.id, title: $0.name, description: "")) }
                    DispatchQueue.main.async {
                        self?.view?.reloadData(for: section)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func didTapCell(with index: IndexPath) {
        guard let users = usersArray else {return}
        let user = users[index.row]
        router.showPostsScreen(with: user)
    }
}
