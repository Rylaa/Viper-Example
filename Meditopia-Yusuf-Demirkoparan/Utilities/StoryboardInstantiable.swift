//
//  StoryboardInstantiable.swift
//  Meditopia-Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 31.03.2022.
//

import UIKit

protocol StoryboardInstantiable: AnyObject {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle? { get }
    static var storyboardIdentifier: String? { get }
}

extension StoryboardInstantiable {
    static var storyboardIdentifier: String? { return nil }
    static var storyboardBundle: Bundle? { return nil }
    
    static func initializeFromStoryboard() -> Self {
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
        
        if let storyboardIdentifier = storyboardIdentifier {
            return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
        } else {
            return storyboard.instantiateInitialViewController() as! Self
        }
    }
}
