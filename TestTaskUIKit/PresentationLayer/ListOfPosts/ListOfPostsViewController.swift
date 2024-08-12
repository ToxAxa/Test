//
//  ListOfPostsViewController.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 10.08.2024.
//

import UIKit

protocol ListOfPostsViewProtocol: AnyObject {
    func updateUserData(name: String)
    func reloadData(for section: SectionViewModel)
}

final class ListOfPostsViewController: UIViewController {
    
    // MARK: Public proporties
    var presenter: ListOfPostsPresentationProtocol?
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Private proporties
    private var section: SectionRowPresentable = SectionViewModel()
    
    // MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurateScreen()
        presenter?.fetchUser()
    }
    
    // MARK: Private methods
    private func configurateScreen() {
        tableView.register(UINib(nibName: ReusableCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: ReusableCell.reuseIdentifier)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "userIcon"),
                                                            style: .plain, target: self, action: #selector(usersDidTap))
    }
    
    @objc private func usersDidTap() {
        presenter?.showUsersList()
    }
}

// MARK: - ListOfPostsInputProtocol
extension ListOfPostsViewController: ListOfPostsViewProtocol {
    func updateUserData(name: String) {
        self.navigationItem.title = name
    }
    
    func reloadData(for section: SectionViewModel) {
        self.section = section
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ListOfPostsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = section.rows[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier, for: indexPath) as? ReusableCell else {
            return UITableViewCell()}
        cell.viewModel = viewModel
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ListOfPostsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didTapCell(with: indexPath)
    }
}
