//
//  RoutesHomeModel.swift
//  Mark2
//
//  Created by Nathan Preston on 30/11/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//
import UIKit
import Foundation

var locations = [String]()
var grades = [String]()
var Rdescs = [String]()
var ImageNums = [String]()

protocol RoutesHomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class RoutesHomeModel: NSObject {

    weak var delegate: RoutesHomeModelProtocol!
    
    var data = Data()
    
    let urlPath: String = "http://tki.ifa.mybluehost.me/routesService.php"//php file
    
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)! //connection
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")//outputting if error
            }
            else {
                print("Data downloaded")
                self.parseJSON(data!)//calling function
            }
            
        }
        
        task.resume() //restarts if paused
    }
    
    
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray() //creating statics arrays
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray //storing JSON data so they can be split into 'key-value pairs'
            
        }
        catch let error as NSError {
            print(error)//NSError shows inforamtion about the type of error
            
        }
        
        var jsonElement = NSDictionary()//collection of key-valued pairs
        let Routes = NSMutableArray()//allows control over array of objects
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let route = RoutesModel()//reference to ealier created model
            
            
            if let location = jsonElement["Location"] as? String,
                let grade = jsonElement["Grade"] as? String,
                let Rdesc = jsonElement["Description"] as? String,
                let ImageNum = jsonElement["ImageNum"] as? String  //making sure no JsonElement values are nil
            {
                route.location = location
                route.grade = grade
                route.Rdesc = Rdesc
                route.ImageNum = ImageNum
            }
            
            locations.append(route.location!)
            grades.append(route.grade!)
            Rdescs.append(route.Rdesc!)
            ImageNums.append(route.ImageNum!)//adding all data to global array, for upload validation

            Routes.add(route)//passes the data
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: Routes)//passing data 
            
        })
    }
    
}
