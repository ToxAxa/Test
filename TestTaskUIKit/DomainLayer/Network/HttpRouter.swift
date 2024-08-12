//
//  Http.swift
//  TestTaskUIKit
//
//  Created by Anton Korchevskyi on 10.08.2024.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol HttpRouter {
    var baseURLString: String { get }
    var path: String { get }
    var method: HTTPMethods { get }
    var headers: [String: String]? { get }
    var parametrs: [String: Any]? { get }
    func body() throws -> Data?
}

extension HttpRouter {
    
    var baseURLString: String { "https://jsonplaceholder.typicode.com/" }

    func asURLRequest() throws -> URLRequest {
        
        let urlComponents = NSURLComponents(string: baseURLString + path)
        
        if let parametrsArray = parametrs, !parametrsArray.isEmpty {
            urlComponents?.queryItems = []
            
            for param in parametrsArray {
                let item = URLQueryItem(
                    name: param.key,
                    value: "\(param.value)"
                )
                urlComponents?.queryItems?.append(item)
            }
        }
        
        guard let url = urlComponents?.url else {
            throw AppError.localizedError(localizedTitle: "Opps")
        }

        print(urlComponents?.url)
        
        var request = URLRequest(url: url)
        request.httpBody = try body()
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue

        return request
    }
    
    func request(usingHttpService service: HttpServiceProtocol, 
                 completionHandler: @escaping (Result<Data, AppError>) -> Void) throws {
        try service.req(asURLRequest(), completionHandler: completionHandler)
    }
}

