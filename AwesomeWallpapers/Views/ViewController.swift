//
//  ViewController.swift
//  AwesomeWallpapers
//
//  Created by Martha R on 13/09/2020.
//  Copyright © 2020 Martha Salomão de Moraes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var infos: [Results] = []
    var service = Service()
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AboutTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "cell")
        loadWallpapers()
    }
    
    // MARK: - Methods
    func loadWallpapers() {
        service.request(router: Router.photos) { (result: Result<Wallpaper>) in
            switch result {
            case .success(let wallpaper):
                self.infos = wallpaper.results
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

 extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                       for: indexPath) as? AboutTableViewCell else {
                                                        return UITableViewCell()
        }

        let wallpaper = infos[indexPath.row]
        cell.prepare(infoWallpaper: wallpaper)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


