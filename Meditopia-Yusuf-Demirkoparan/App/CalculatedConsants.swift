//
//  CalculatedConsants.swift
//  Yusuf-Demirkoparan
//
//  Created by Yusuf Demirkoparan on 2.04.2022.
//

import UIKit

final class CalculatedConsants {
    static let phoneHeight: CGFloat = {
        var width: CGFloat = 156
        let calculatedWidth = (UIScreen.main.bounds.width / 2) - 42
        let ratio = calculatedWidth / width
        let lastHeight: CGFloat = (209 * ratio) + 32
        return lastHeight
    }()
    
    static let phoneHeightWide: CGFloat = {
        var width: CGFloat = 156
        let calculatedWidth = phoneWidthWide
        let ratio = calculatedWidth / width
        let lastHeight: CGFloat = (209 * ratio) + 32
        return lastHeight
    }()
    
    static let phoneWidth: CGFloat = {
        let width: CGFloat = (UIScreen.main.bounds.width / 2) - 42
       return width
    }()
    
    static let phoneWidthWide: CGFloat = {
        let width: CGFloat = (UIScreen.main.bounds.width - 160 ) / 4
       return width
    }()
    
    static let padLineCount: Int = {
        return Int((UIScreen.main.bounds.width - 46) / 169)
    }()
}
