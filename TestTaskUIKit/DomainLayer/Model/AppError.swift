//
//  AppError.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 11.08.2024.
//

import Foundation

typealias Callback<Model: Any> = ((Model) -> Void)
typealias ResultCallback<Model: Any, AppError: Error> = Callback<Result<Model, AppError>>

enum AppError: Error, LocalizedError {
    case unhandled
    case invalidResponse
    case invalidData
    case decoding
    case localizedError(localizedTitle: String)
    
    var errorDescription: String? {
        switch self {
        case .unhandled:
            return nil
        case .invalidResponse:
            return "invalidResponse"
        case .invalidData:
            return "invalidData"
        case .localizedError(let localizedTitle):
            return localizedTitle
        case .decoding:
            return "invalidDataDecoding"
        }
    }
}


