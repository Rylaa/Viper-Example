//
//  HttpDefaults.swift
//  Meditopia-Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 31.03.2022.
//

import Foundation

final class NetworkDefaults: NSObject, URLSessionDelegate {
    
    static var subscribeQueue = DispatchQueue.init(label: "Meditopia-", qos: .background)
    
    func configuration() -> URLSession {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 60
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 10
        configuration.urlCache = .shared
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }
    
    static func headers(isRefreshTokenRequest: Bool = false) -> [HTTPHeader] {
        var headers = [HTTPHeader]()
        headers.append(HTTPHeader(name: "Accept", value: "application/json; charset=utf-8"))
        headers.append(HTTPHeader(name: "Content-Type", value: "application/json; charset=utf-8"))
        return headers
    }

    
}
