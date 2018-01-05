//
//  Outdoor.swift
//  Mark2
//
//  Created by Nathan Preston on 05/10/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//


import UIKit


var Ofiltered:[String] = []
var OsearchActive : Bool = false
var OindexFind = 0

class Outdoor: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate  {
    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(OsearchActive) {
            return Ofiltered.count
        }
        return(Olist.count)//Sets number rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PlacesTableViewCell
        if(OsearchActive){
            cell.OutdoorTag.text = Ofiltered[indexPath.row]
        }
        else{
            cell.OutdoorTag.text = Olist[indexPath.row] //gives contents of a row
        }
        
        return(cell)//outputs the table
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row //an integer is outputted depnding on which option is chosen. Such as the first row when clicked gives 0, then the second gives 1
        performSegue(withIdentifier: "Osegue", sender: self)// activates the segue to the controller with the map
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)//setting the colour
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        OsearchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        OsearchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        OsearchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        OsearchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        Ofiltered = Olist.filter({ (text) -> Bool in
            let temp: NSString = text as NSString
            let range = temp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(Ofiltered.count == 0){
            OsearchActive = false;
        } else {
            OsearchActive = true;
        }
        self.tableView.reloadData()
    }
    
}

