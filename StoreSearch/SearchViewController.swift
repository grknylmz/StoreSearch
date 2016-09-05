//
//  ViewController.swiftÎ
//  StoreSearch
//
//  Created by Gurkan Yilmaz on 05/09/16.
//  Copyright © 2016 Gurkan Yilmaz. All rights reserved.
//

import UIKit


var searchResults = [String]()

class SearchViewController: UIViewController , UITableViewDelegate{
    
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        for i in 0...2 {
            searchResults.append(String(format: "Fake Result %d for '%@'", i,
                searchBar.text!))
        }
        tableView.reloadData()
    }
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition { return .TopAttached
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return searchResults.count }
    
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "SearchResultCell"
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .Default,
                                   reuseIdentifier: cellIdentifier)
        }
        cell.textLabel!.text = searchResults[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        print(searchResults[row])
    }
    
}
//extension SearchViewController: UITableViewDelegate { }












