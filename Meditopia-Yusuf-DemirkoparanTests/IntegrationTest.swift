//
//  IntegrationTest.swift
//  Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 2.04.2022.
//

import XCTest
@testable import Meditopia_Yusuf_Demirkoparan
import Foundation


class IntegrationTests: XCTestCase {
    
   
    private var networkProtocol: NetworkProtocol!
    
    override func setUp() {
        let configUrlSession = URLSessionConfiguration.ephemeral
        configUrlSession.protocolClasses = [SimuleURLSession.self]
        let session = URLSession(configuration: configUrlSession)
        networkProtocol = NetworkLayer(resultQueue: .main, session)
    }
    
    func test_HappyPath_Response() throws {
        let expect = expectation(description: "result happy path")
        let api = Api()
        api.network = networkProtocol as! NetworkLayer
        let mockJSON = try ResourceLoader.loadMeditationjson()
        SimuleURLSession.stubResponseData = mockJSON
        api.getStories { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.uiTitle.isEmpty, false)
                expect.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        expect.fulfill()
        wait(for: [expect], timeout: 15)
    }
    
    func test_Error_Response() throws {
        let expect = expectation(description: "result error")
        let api = Api()
        api.network = networkProtocol as! NetworkLayer
        SimuleURLSession.stubError = NetworkError.serverError(code: 500, error: "", stringCode: "")
        api.getStories { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription.isEmpty, false)
                expect.fulfill()
            case .success(_):
                XCTFail()
            }
        }
        wait(for: [expect], timeout: 10)
    }
}
