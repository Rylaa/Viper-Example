//
//  ErrorResponseModel.swift
//  Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 31.03.2022.
//

import Foundation
/*
 Varsayım sadece :)
 */
struct ErrorResponseParentModel: Codable {
    let success: Bool
    let error: ErrorResponseModel
}

struct ErrorResponseModel: Codable {
    let errorCode: String?
    let message: String
}
