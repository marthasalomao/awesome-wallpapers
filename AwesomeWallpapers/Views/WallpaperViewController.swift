//
//  WallpaperViewController.swift
//  AwesomeWallpapers
//
//  Created by Martha R on 20/09/2020.
//  Copyright © 2020 Martha Salomão de Moraes. All rights reserved.
//

import UIKit

class WallpaperViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var ivWallpaper: UIImageView!
    
    // MARK: - Properties
    var wallpaper: Results?
    
    // MARK: - Initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(wallpaper: Results) {
        super.init(nibName: nil, bundle: nil)
        self.wallpaper = wallpaper
    }
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let results = wallpaper  else { return }
        prepare(wallpaper: results)

    }
    
    // MARK: - Methods
    func prepare(wallpaper: Results) {
        guard let imageURL = wallpaper.urls?.regular else { return }
        let url = URL(string: imageURL)
        ivWallpaper.kf.setImage(with: url)
    }
}
