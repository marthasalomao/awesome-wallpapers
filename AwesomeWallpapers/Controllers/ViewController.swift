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
    var infos: [InfoWallpaper] = []
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AboutTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "cell")
        loadInfoWallpaper()
    }
    
    // MARK: - Methods
    func loadInfoWallpaper() {
        let fileURL = Bundle.main.url(forResource: "unsplash.json", withExtension: nil)
        guard let url = fileURL else { return }
        do {
            let jsonData = try Data(contentsOf: url)
            infos = try JSONDecoder().decode([InfoWallpaper].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
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


