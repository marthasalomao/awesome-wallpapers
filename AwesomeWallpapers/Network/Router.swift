//
//  Router.swift
//  AwesomeWallpapers
//
//  Created by Martha R on 18/09/2020.
//  Copyright © 2020 Martha Salomão de Moraes. All rights reserved.
//

import Foundation

enum Router {
    case photos
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "api.unsplash.com"
    }
    
    var path: String {
        return "/search/photos"
    }
    
    var parameters: [URLQueryItem] {
        let clientID = "TEHnKtynKeu7ipTwMXvXgdpk9pn20zS-dh10H8PMn1M"
        let query = "wallpapers"
        
        return [URLQueryItem(name: "client_id", value: clientID),
                URLQueryItem(name: "query", value: query)]
    }
    
    var method: String {
        return "GET"
    }
}
