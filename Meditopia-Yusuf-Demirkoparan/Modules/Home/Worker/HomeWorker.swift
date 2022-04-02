//
//  HomeWorker.swift
//  Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 1.04.2022.
//

import Foundation

extension Api: HomeWorkerConformable {
    func getStories(completion: @escaping (Result<MeditationResponse>) -> Void) {
        let url = ApiConstants.meditation
        network.get(url: url, completion: completion)
    }
}
