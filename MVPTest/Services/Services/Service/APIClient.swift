//
//  APIClient.swift
//  Services
//
//  Created by Miguel Roncallo on 10/14/19.
//  Copyright © 2019 Miguel Roncallo. All rights reserved.
//

import UIKit
import RxSwift

public final class APIClient: ClientType {
    struct Constants {
        static let url = "https://www.balldontlie.io/api/v1"
    }
    
    public init() {
    }
    
    public func performOperation<T: Codable>(request: APIRequest) -> Single<T> {
        return makeRequest(request: request)
    }
    
    private func makeRequest<T: Codable>(request: APIRequest)
        -> PrimitiveSequence<SingleTrait, T> {
        return Single<T>.create(subscribe: {(emitter) -> Disposable in
            guard let urlComponents = NSURLComponents(string: Constants.url + request.path) else {
                return Disposables.create()
            }
            var queryParams = [URLQueryItem]()
            if let params = request.parameters {
                for (key, value) in params {
                    queryParams.append(URLQueryItem(name: key, value: "\(value)"))
                }
            }
            if !queryParams.isEmpty {
                urlComponents.queryItems = queryParams
            }
            
            print(urlComponents.url!)
            var httpRequest = URLRequest(url: urlComponents.url!)
            httpRequest.httpMethod = request.method.rawValue
            
            let manager = URLSession(configuration: .default)
            let task = manager.dataTask(with: httpRequest) { (data, response, error) in
                if let err = error {
                    emitter(.error(err))
                }
                self.handleResponse(data: APIDataResponse(data: data,
                                                          error: error),
                                    emitter: emitter)
                
                
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        })
    }
    
    private func handleResponse<T: Codable> (
        data: APIDataResponse,
        emitter: (SingleEvent<T>) -> Void) {
        let decoder = JSONDecoder()
        guard let validatedData = data.data else {
            let error = NSError(domain: "Invalid data", code: -8, userInfo: nil)
            print("error")
            return emitter(.error(error))
        }
        do {
            let apiResponse = try decoder.decode(APIResponse<T>.self, from: validatedData)
            guard let result = apiResponse.data else {
                print("error")
                let error = NSError(domain: "Invalid data", code: -8, userInfo: nil)
                return emitter(.error(error))
            }
            emitter(.success(result))
        } catch {
            return emitter(.error(error))
        }
    }
    
}
