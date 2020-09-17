//
//  AboutTableViewCell.swift
//  AwesomeWallpapers
//
//  Created by Martha R on 13/09/2020.
//  Copyright © 2020 Martha Salomão de Moraes. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var lbWallpaperName: UILabel!
    @IBOutlet weak var lbWallpaperSubtitle: UILabel!
    @IBOutlet weak var ivWallpaper: UIImageView!
    

    // MARK: - Methods
    func prepare(infoWallpaper: InfoWallpaper) {
        lbWallpaperName.text = infoWallpaper.user?.name
        lbWallpaperSubtitle.text = infoWallpaper.description ?? "Unknown"
        
    }
    
}

