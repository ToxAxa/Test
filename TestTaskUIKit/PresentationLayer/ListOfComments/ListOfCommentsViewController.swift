//
//  ListOfCommentsViewController.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import UIKit

protocol ListOfCommentsViewProtocol: AnyObject {
    func updateTitleData(name: String)
    func reloadData(for section: SectionViewModel)
}

final class ListOfCommentsViewController: UIViewController {

    // MARK: Public proporties
    var presenter: ListOfCommentsPresentationProtocol?
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Private proporties
    private var section: SectionRowPresentable = SectionViewModel()
    
    // MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()

        configurateScreen()
        presenter?.fetchComments()
    }
    
    // MARK: Private methods
    private func configurateScreen() {
        tableView.register(UINib(nibName: ReusableCell.reuseIdentifier, bundle: nil),
                                    forCellReuseIdentifier: ReusableCell.reuseIdentifier)
    }
}

// MARK: - ListOfCommentsInputProtocol
extension ListOfCommentsViewController: ListOfCommentsViewProtocol {
    func updateTitleData(name: String) {
        self.navigationItem.title = name
    }
    
    func reloadData(for section: SectionViewModel) {
        self.section = section
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ListOfCommentsViewController: UITableViewDataSource {
    
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
