//
//  ViewController.swift
//  WeatherApp
//
//  Created by Иван Гришин on 10.01.2022.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Weather"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    //MARK: - UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
        print(text)
    }
}

