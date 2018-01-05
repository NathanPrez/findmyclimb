//
//  InsideRoutes.swift
//  Mark2
//
//  Created by Nathan Preston on 30/11/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit

class InsideRoutes: UIViewController, UITableViewDelegate, UITableViewDataSource, RoutesHomeModelProtocol {
    

    var feedItems: NSArray = NSArray()//store objects
    var selectedDetail : RoutesModel = RoutesModel()//reference to ealier model
    var tableLoop = 0, count = 0, countLoop = 0

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        let routesHomeModel = RoutesHomeModel()//reference
        routesHomeModel.delegate = self
        routesHomeModel.downloadItems()//implements models protocol
        
        // Do any additional setup after loading the view.
        
        //let url = URL(string: "http://tki.ifa.mybluehost.me/picTest1.php")
        
        
    }
    
    
    func itemsDownloaded(items: NSArray) {
        feedItems = items
        self.tableView.reloadData()//store values passed through and reload
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var x = 0
        while(x<feedItems.count){
            if((feedItems[x] as! RoutesModel).location==IchosenLocation){
                count = count + 1 //if location is the same then count is increased
            }
             x=x+1 //loop
        }
        return(count) // number of rows
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! RoutesTableViewCell

        var item: RoutesModel = feedItems[tableLoop] as! RoutesModel //points of data
        var url = URL(string: "http://tki.ifa.mybluehost.me/userPictureUpload/0.jpg")
        var endLoop = 0
        
        while(tableLoop<feedItems.count){
            item = feedItems[tableLoop] as! RoutesModel //needs redeclaring everyloop for new value
            if((item.location!)==IchosenLocation){ //if location is correct
                cell.IGrade.text = "Grade: " + item.grade!
                cell.IDesc.text = "Description: " + item.Rdesc! //output data
                
                print (item.ImageNum!)
                url = URL(string: "http://tki.ifa.mybluehost.me/userPictureUpload/\(item.ImageNum!).jpg")
                let task = URLSession.shared.dataTask(with: url!) { (data, responce, error) in
                    var documentsDictionary:String?
                    var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                    if (paths.count > 0){
                        documentsDictionary = paths[0]
                        let savePath = documentsDictionary! + "/climbingPicture\(item.ImageNum!).jpg"
                        FileManager.default.createFile(atPath: savePath, contents: data, attributes: nil)
                        
                        DispatchQueue.main.async {
                            cell.IPic.image = UIImage(named: savePath)
                            print("output")
                        }
                    }
                }
                task.resume()
                
                endLoop = 1
            }
            tableLoop = tableLoop + 1
            if(endLoop == 1){//break statement
                break
            }
        }
       
        if(countLoop == count){
            tableLoop = 0 //the loop of feedItems is reset oncce all rows are filled
        }
        
        countLoop = countLoop + 1
        
        
       
        
        cell.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0) //colour of cells
        return(cell)//outputs the cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210 // height of a cell
    }




}
