//
//  ViewController.swiftÎ
//  StoreSearch
//
//  Created by Gurkan Yilmaz on 05/09/16.
//  Copyright © 2016 Gurkan Yilmaz. All rights reserved.
//

import UIKit


var searchResults = [SearchResult]()


class SearchViewController: UIViewController , UITableViewDelegate{
    var hasSearched = false
    
    
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "SearchResultCell", bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: "SearchResultCell")
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        hasSearched = true
        for i in 0...2 {
            
            
            let searchResult = SearchResult()
            searchResult.name = String(format: "Fake Result %d for", i)
            searchResult.artistName = searchBar.text!
            searchResults.append(searchResult)
        }
        tableView.reloadData() // Reload Data for Table
    }
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition { return .TopAttached
    }
}



extension SearchViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        if !hasSearched {
            return 0
        }
        else if searchResults.count == 0 {
            return 1
        }
        else {
            return searchResults.count
        }
    }
    
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "SearchResultCell"
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchResultCell", forIndexPath: indexPath)
//        if cell == nil {
//            cell = UITableViewCell(style: .Subtitle,
//                                   reuseIdentifier: cellIdentifier)
//        }
        
        if searchResults.count == 0 {
            
            cell.textLabel!.text = "(Nothing found)"
            cell.detailTextLabel!.text = ""
        }
        else
        {
            let searchResult = searchResults[indexPath.row]
            cell.textLabel!.text = searchResult.name
            cell.detailTextLabel!.text = searchResult.artistName
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        searchBar.resignFirstResponder()
        let row = indexPath.row
        print(searchResults[row])
    }
    
    func tableView(tableView: UITableView,
                   willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if searchResults.count == 0 {
            return nil
        }
        else {
            return indexPath
        }
    }
        
}
//extension SearchViewController: UITableViewDelegate { }



