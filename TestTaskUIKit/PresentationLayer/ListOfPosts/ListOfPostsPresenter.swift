//
//  ListOfPostsPresenter.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 10.08.2024.
//

import Foundation

protocol ListOfPostsPresentationProtocol {
    func fetchPosts()
    func fetchUser()
    func didTapCell(with index: IndexPath)
    func showUsersList()
}

final class ListOfPostsPresenter {
    
    // MARK: Private proporties
    private weak var view: ListOfPostsViewProtocol?
    private let router: ListOfPostsRoutingProtocol
    private let interactor: ListOfPostsInteractorProtocol
    private var postsArray: [PostModel]?
    
    init(view: ListOfPostsViewProtocol, router: ListOfPostsRoutingProtocol, interactor: ListOfPostsInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension ListOfPostsPresenter: ListOfPostsPresentationProtocol {
    func fetchUser() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor.fetchUser { result in
                switch result {
                case .success(let user):
                    self?.fetchPosts()
                    DispatchQueue.main.async {
                        self?.view?.updateUserData(name: user.name)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

    func fetchPosts() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor.fetchPosts { result in
                switch result {
                case .success(let modelArray):
                    self?.postsArray = modelArray
                    let section = SectionViewModel()
                    modelArray.forEach { section.rows.append(CellViewModel(id: $0.id, title: $0.title, description: $0.body)) }
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
        guard let posts = postsArray else {return}
        let postId = posts[index.row].id
        router.showCommentsScreen(with: postId)
    }
    
    func showUsersList() {
        router.showUsersList { [weak self] user in
            self?.interactor.updateUser(user: user)
            self?.view?.updateUserData(name: user.name)
            self?.fetchPosts()
        }
    }
}
