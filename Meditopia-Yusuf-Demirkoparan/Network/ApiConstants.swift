//
//  ApiConstants.swift
//  Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 1.04.2022.
//

import Foundation

struct ApiConstants {
    
    static var baseUrl: String = {
        let baseUrl = "https://media.meditopia.com/"
        return baseUrl
    }()
    
    static var meditation = baseUrl + "files/MobileInterviewProjectData.json"
    
}
