//
//  InfoWallpaper.swift
//  AwesomeWallpapers
//
//  Created by Martha R on 14/09/2020.
//  Copyright © 2020 Martha Salomão de Moraes. All rights reserved.
//

import Foundation

struct Wallpaper: Codable {
    var results: [Results]
}

struct Results: Codable {
    var urls: Urls?
    var user: User?
    let description: String?
}

struct Urls: Codable {
    var raw: String?
    var full: String?
    var regular: String?
    var small: String?
    var thumb: String?
}

struct User: Codable {
    var name: String?
}

