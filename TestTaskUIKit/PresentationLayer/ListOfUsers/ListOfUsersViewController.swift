//
//  ListOfUsersViewController.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import UIKit

protocol ListOfUsersViewProtocol: AnyObject {
    func reloadData(for section: SectionViewModel)
}

class ListOfUsersViewController: UIViewController {

    // MARK: Public proporties
    var presenter: ListOfUsersPresentationProtocol?
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Private proporties
    private var section: SectionRowPresentable = SectionViewModel()
    
    // MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurateScreen()
        presenter?.fetchUsers()
    }
    
    // MARK: Private methods
    private func configurateScreen() {
        tableView.register(UINib(nibName: ReusableCell.reuseIdentifier, bundle: nil),
                                    forCellReuseIdentifier: ReusableCell.reuseIdentifier)
        self.navigationItem.title = "Users"
    }
}

// MARK: - ListOfUsersInputProtocol
extension ListOfUsersViewController: ListOfUsersViewProtocol {
    func reloadData(for section: SectionViewModel) {
        self.section = section
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ListOfUsersViewController: UITableViewDataSource {
    
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
extension ListOfUsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didTapCell(with: indexPath)
    }
}
