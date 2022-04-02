//
//  ResponseParser.swift
//  Meditopia-Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 31.03.2022.
//

import Foundation

final class GenericParser<T: Codable> {
    
    let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
    
    func parse(data: Data?, completion: @escaping (Result<T>) -> Void) {
        guard let data = data else {return }
        do {
            let result = try decoder.decode(T.self, from: data)
            completion(.success(result))
        }catch(let error) {
            completion(.failure(error))
        }
    }
    
}
