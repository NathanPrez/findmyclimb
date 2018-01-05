//
//  HomeModel.swift
//  Mark2
//
//  Created by Nathan Preston on 28/10/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import Foundation

var Fnames = [String]()
var Snames = [String]()
var numbers = [String]()
var emails = [String]()
var descs = [String]()

protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class HomeModel: NSObject, URLSessionDataDelegate {
    
    weak var delegate: HomeModelProtocol!
    
    var data = Data()
    
    let urlPath: String = "http://tki.ifa.mybluehost.me/service.php"//php file

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
        let Details = NSMutableArray()//allows control over array of objects
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let detail = DetailsModel()//reference to ealier created model
            
            
            if let Fname = jsonElement["First Name"] as? String,
                let Sname = jsonElement["Second Name"] as? String,
                let number = jsonElement["Phone Number"] as? String, //making sure no JsonElement values are nil
                let email = jsonElement["Email"] as? String,
                let desc = jsonElement["Description"] as? String
            {
                
                detail.Fname = Fname
                detail.Sname = Sname
                detail.number = number
                detail.email = email
                detail.desc = desc
            }
            
            Fnames.append(detail.Fname!)
            Snames.append(detail.Sname!)
            numbers.append(detail.number!)//adding all data to global array, for upload validation
            emails.append(detail.email!)
            descs.append(detail.desc!)
           
            
            
            Details.add(detail)//passes the data
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: Details)//to let it know data has been added
            
        })
    }
    
    
}
