//
//  ListOfCommentsPresenter.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import Foundation

protocol ListOfCommentsPresentationProtocol {
    func fetchComments()
}

final class ListOfCommentsPresenter {
    
    // MARK: Private proporties
    private weak var view: ListOfCommentsViewProtocol?
    private let router: ListOfCommentsRoutingProtocol
    private let interactor: ListOfCommentsInteractorProtocol
    
    init(view: ListOfCommentsViewProtocol, router: ListOfCommentsRoutingProtocol, interactor: ListOfCommentsInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension ListOfCommentsPresenter: ListOfCommentsPresentationProtocol {
    func fetchComments() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor.fetchComments { result in
                switch result {
                case .success(let commentsArray):
                    let section = SectionViewModel()
                    commentsArray.forEach { section.rows.append(CellViewModel(id: $0.id, title: $0.email, description: $0.body)) }
                    DispatchQueue.main.async {
                        self?.view?.reloadData(for: section)
                        self?.view?.updateTitleData(name: "Comments (\(commentsArray.count))")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
