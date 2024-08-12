//
//  Storyboards.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 10.08.2024.
//

import UIKit

enum StoryboardsIdentifier: String {
    case listOfPostsVC = "ListOfPostsViewController"
    case charactersInfo = "CharacterInformationViewController"
}

enum Storyboards {
    case listOfPostsVC
    case charactersInfo
    
    var instance: UIStoryboard {
        
        switch self {
        case .listOfPostsVC:
            return UIStoryboard.init(name: "ListOfPosts", bundle: nil)
        case .charactersInfo:
            return UIStoryboard.init(name: "CharacterInformation", bundle: nil)
        }
    }
}
