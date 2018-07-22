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

class ViewController: UIViewController {
    
    @IBOutlet weak var movieSearch: UISearchBar!
    
    let movies = ["Split", "Star Wars", "Shrek"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieSearch.rx.text
            .orEmpty // To check if something is in response
            .distinctUntilChanged() // Respond to change during typing
            .filter{ !$0.isEmpty }
            .throttle(0.5, scheduler: MainScheduler.instance)
            .subscribe(onNext: { query in
                let url = "http://img.omdbapi.com/?apikey=[yourkey]&" + query
            })
   }


}

