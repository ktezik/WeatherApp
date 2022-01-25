//
//  ViewController.swift
//  WeatherApp
//
//  Created by Иван Гришин on 10.01.2022.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating {
    
    var cityLists: [CityList] = []
    
    let searchController = UISearchController(searchResultsController: SearchResultViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        getJsonFromDirectory()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Weather"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    //MARK: - UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text,
                !text.trimmingCharacters(in: .whitespaces).isEmpty,
              let searchVC = searchController.searchResultsController as? SearchResultViewController
        else { return }
        
        var array: [String] = []
        
        for object in cityLists {
            let name = object.name as! String
            array.append(name)
        }
        
        searchVC.update(with: array.filter({$0.contains(text)}))
        
        print(cityLists.count)
        print(array.count)
        
        print(text)
    }
}

extension ViewController {
    func getJsonFromDirectory() {
            if let path = Bundle.main.path(forResource: "cityList", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                    self.cityLists = try JSONDecoder().decode([CityList].self, from: data)

                } catch let error {
                    print("parse error: \(error.localizedDescription)")
                }
            } else {
                print("Invalid filename/path.")
            }
        }
}

