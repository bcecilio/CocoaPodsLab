//
//  APIClient.swift
//  CocoaPodsLab
//
//  Created by Brendon Cecilio on 3/3/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import Foundation
import Alamofire

struct APIClient {
    static func getUsers(completion: @escaping (AFResult<Result>) -> ()) {
        
        let endpoint = "https://randomuser.me/api"
        guard let url = URL(string: endpoint) else {
            return
        }
        
        AF.request(url).response { (response) in
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(User.self, from: data)
                    if let user = result.results.first {
                        completion(.success(user))
                    }
                } catch {
                    print("\(error)")
                }
            }
        }
    }
}
