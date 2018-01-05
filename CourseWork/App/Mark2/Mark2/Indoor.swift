//
//  Indoor.swift
//  Mark2
//
//  Created by Nathan Preston on 05/10/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit

var Ifiltered:[String] = []
var IsearchActive : Bool = false
var IindexFind = 0



class Indoor: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(IsearchActive) {
            return Ifiltered.count//if the search bar is used the temporary filtered array is used instead of the full array Ilist
        }
        return(Ilist.count)//Sets number rows
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PlacesTableViewCell
        if(IsearchActive){
            cell.IndoorTag.text = Ifiltered[indexPath.row]//if the search bar is used the number of pieces of data within the temporary filtered array is used instead of the full array Ilist
        }
        else{
            cell.IndoorTag.text = Ilist[indexPath.row] //gives contents of a row
        }
        return(cell)//outputs the table
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row //an integer is outputted depnding on which option is chosen. Such as the first row when clicked gives 0, then the second gives 1
        performSegue(withIdentifier: "segue", sender: self)// activates the segue to the controller with the map
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0)//setting the colour
    }
    
    
    
    ///SearchBar
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        IsearchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        IsearchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        IsearchActive = false;
        self.searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        IsearchActive = false;
        self.searchBar.endEditing(true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        Ifiltered = Ilist.filter({ (text) -> Bool in
            let temp: NSString = text as NSString
            let range = temp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)//inputting data within the temporary filtered list
            return range.location != NSNotFound
        })
        
        if(Ifiltered.count == 0){
            IsearchActive = false; //seeing if the temporary folder has any data inputted
        } else {
            IsearchActive = true;
        }
 
        self.tableView.reloadData()
    }
    
    //Hiding Keyboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.searchBar.endEditing(true)
    }
    
}

