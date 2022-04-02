//
//  MeditationResponse.swift
//  Meditopia-Yusuf-Demirkoparan
//
//  Created by yusuf demirkoparan on 31.03.2022.
//

import Foundation

enum MeditationAndStoryType {
    case story
    case meditation
    case banner
}

// MARK: --
struct MeditationResponse: Codable {
    let isBannerEnabled: Bool?
    let meditations: [MeditationResponseModel]?
    let stories: [StoryResponseModel]?
}

extension MeditationResponse: MeditationAndStoryResultable {
    var uiDate: String {
        return ""
    }
    
    var banner: Bool {
        return isBannerEnabled ?? false
    }
  
    var uiTitle: String {
        return ""
    }
    
    var uiSubTitle: String {
        return ""
    }
    
    var url: URL? {
        return URL(string: "")
    }
    
    var uiContent: String {
        return  ""
    }
}

struct ImageResponseModel: Codable {
    let small, large: String?
}
// MARK: --
struct MeditationResponseModel: Codable {
    let title, subtitle: String?
    let image: ImageResponseModel?
    let releaseDate, content: String?
}

extension MeditationResponseModel: MeditationAndStoryResultable {
    var uiDate: String {
        return Double(self.releaseDate ?? "")?.timeIntervalToDate() ?? ""
    }
    
    var uiTitle: String {
        return title ?? ""
    }

    var uiSubTitle: String {
        return subtitle ?? ""
    }

    var url: URL? {
        return URL(string: image?.small ?? "")
    }
    
    var uiContent: String {
        return content ?? ""
    }
}
// MARK: --
struct StoryResponseModel: Codable {
    let name, category: String?
    var image: ImageResponseModel?
    let date, text: String?
}

extension StoryResponseModel: MeditationAndStoryResultable {
    var uiDate: String {
        return Double(self.date ?? "")?.timeIntervalToDate() ?? ""
    }
    
    var uiTitle: String {
        return name ?? ""
    }
    
    var uiSubTitle: String {
        return text ?? ""
    }
    
    var url: URL? {
        return URL(string: image?.small ?? "")
    }
    
    var banner: Bool {
        return false
    }
    
    var uiContent: String {
        return text ?? ""
    }
}
