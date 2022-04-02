//
//  Result.swift
//  Meditopia-Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 31.03.2022.
//

import Foundation

enum Result<T> {
  case success(T)
  case failure(Error)
}
