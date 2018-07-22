//
//  ViewController.swift
//  MovieSearch
//
//  Created by Kirill G on 7/22/18.
//  Copyright © 2018 ns-ios. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var movieSearch: UISearchBar!
    
    var movies = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieSearch.rx.text
            .orEmpty // To check if something is in response
            .distinctUntilChanged() // Respond to change during typing
            .filter{ !$0.isEmpty }
            .throttle(0.5, scheduler: MainScheduler.instance)
            .subscribe(onNext: { query in
                let url = "https://www.omdbapi.com/?apikey=" + Constants.omdbKey + "&s=" + query
                
                Alamofire.request(url).responseJSON(completionHandler: { response in
                    if let value = response.result.value {
                        let json = JSON(value)
                        self.movies.removeAll() // Clear array before every search
                        
                        for movie in json["Search"] {
                            if let title = movie.1["Title"].string {
                                self.movies.append(title)
                            }
                        }
                    }
                    self.tableView.reloadData()
                })
            })
   }
}

