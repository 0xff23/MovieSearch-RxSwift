//
//  FavoriteViewControllerExtension.swift
//  MovieSearch
//
//  Created by Kirill G on 7/22/18.
//  Copyright © 2018 ns-ios. All rights reserved.
//

import Foundation
import UIKit

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell")
        
        cell?.textLabel?.text = favoriteMovies[indexPath.row]
        
        return cell!
    }
    
    
}
