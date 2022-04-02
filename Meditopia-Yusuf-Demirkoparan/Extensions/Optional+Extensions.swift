//
//  Optional+Extensions.swift
//  Meditopia_Yusuf_Demirkoparan
//
//  Created by yusuf demirkoparan on 3.04.2022.
//

import Foundation
extension Optional {
    struct FoundNilWhileUnwrappingError: Error { }
    func unwrap() throws -> Wrapped {
        switch self {
        case .some(let wrapped):
            return wrapped
        case .none:
            throw FoundNilWhileUnwrappingError()
        }
    }
}
