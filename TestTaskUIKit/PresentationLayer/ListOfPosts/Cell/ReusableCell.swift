//
//  PostListCell.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import UIKit


class ReusableCell: UITableViewCell, ReusableNibProvider, CellModelRepresentable {

    // MARK: Public proporties
    var viewModel: CellIdentifiable? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var titleLabelText: UILabel!
    @IBOutlet weak var bodyLabelText: UILabel!

    private func updateViews() {
        guard let cellViewModel = viewModel as? CellViewModel else { return }
        titleLabelText.text = cellViewModel.title
        bodyLabelText.text = cellViewModel.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class SectionViewModel: SectionRowPresentable {
    var rows: [CellIdentifiable] = []
}
