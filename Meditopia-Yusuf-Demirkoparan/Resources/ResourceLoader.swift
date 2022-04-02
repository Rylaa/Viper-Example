//
//  ResourceLoader.swift
//  Meditopia-Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 2.04.2022.
//

import Foundation

class ResourceLoader {
    
    static func loadMeditationjson() throws -> Data {
        let bundle = Bundle.test
        let url = try bundle.url(forResource: "meditation", withExtension: "json").unwrap()
        let data = try Data(contentsOf: url)
        return data
    }
}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}
