//
//  PostListCell+Protocols.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import Foundation

protocol CellModelRepresentable {
    var viewModel: CellIdentifiable? { get set }
}

protocol CellIdentifiable {
    var cellIdentifier: String { get }
}

protocol SectionRowPresentable {
    var rows: [CellIdentifiable] { get set }
}
