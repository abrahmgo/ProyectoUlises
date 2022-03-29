//
//  AlamofireRequest.swift
//  webServices
//
//  Created by Andrés Bonilla Gómez on 28/03/22.
//

import Foundation
import Alamofire

class AlamofireRequest {
    
    func downloadData(url: String,
                      method: HTTPMethod,
                      completion: @escaping ([String: Any]) -> (Void)) {
        
        AF.request(url,
                   method: method,
                   parameters: nil,
                   encoding: JSONEncoding.default,
                   headers: nil).responseJSON { result in
            switch result.result {
            case .success(let data):
                if let info = data as? [String: Any] {
                    completion(info)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
