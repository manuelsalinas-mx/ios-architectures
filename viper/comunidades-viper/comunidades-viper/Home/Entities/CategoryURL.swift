//
//  CategoryURL.swift
//  comunidades-viper
//
//  Created by Manuel Salinas on 1/10/24.
//

import Foundation

struct CategoryURL: Codable {

    var links: Links

    enum CodingKeys: String, CodingKey {
        case links = "_links"
    }

    // Internal models
    struct UrlInfo: Codable {
        var href: String
    }

    struct Links: Codable {
        var mySelf: [UrlInfo]

        enum CodingKeys: String, CodingKey {
            case mySelf = "self"
        }
    }
}
