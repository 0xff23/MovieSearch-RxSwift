//
//  FavoriteViewController.swift
//  MovieSearch
//
//  Created by Kirill G on 7/22/18.
//  Copyright © 2018 ns-ios. All rights reserved.
//

import UIKit
import Firebase

class FavoriteViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    var favoriteMovies = [String]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    var movieKeys = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        ref.child(Constants.folderName).observeSingleEvent(of: .value) { snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                let favoriteMovieDict = child.value as? [String:String] ?? [:]
                if let favoriteMovie = favoriteMovieDict["movie-title"] {
                    self.favoriteMovies.append(favoriteMovie)
                }
            }
        }

        // Do any additional setup after loading the view.
    }

}
