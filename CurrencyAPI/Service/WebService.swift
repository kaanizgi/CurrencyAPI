//
//  WebService.swift
//  design
//
//  Created by Kaan İzgi on 30.08.2022.
//

import Foundation
import Combine

class APIService {
    
    static let shared = APIService()
    
    func fetch<T: Decodable>(url: URL,expecting:T.Type) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            
            .tryMap{(data,response) -> Data in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.cannotDecodeRawData)
                }
                return data
            }
            .decode(type: expecting, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
