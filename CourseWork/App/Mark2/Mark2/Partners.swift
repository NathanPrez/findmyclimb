//
//  Partners.swift
//  Mark2
//
//  Created by Nathan Preston on 14/10/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit

var hasInputted = "0"

class Partners: UIViewController, UITableViewDelegate, UITableViewDataSource, HomeModelProtocol {
    
    var postString = ""
    var feedItems: NSArray = NSArray()//store objects
    var selectedDetail : DetailsModel = DetailsModel()//reference to ealier model
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var counter: UITextView!
    
    func itemsDownloaded(items: NSArray) {
        feedItems = items
        print(feedItems.count)
        
        counter.text = ("Currently \(feedItems.count) people have added their details!") //printing number of 'Partners'
        
        self.tableView.reloadData()//store values passed through and reload
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeModel = HomeModel()//reference
        homeModel.delegate = self
        homeModel.downloadItems()//implements models protocol
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count // number of row
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PartnersTableViewCell
        
        let item: DetailsModel = feedItems[indexPath.row] as! DetailsModel //making constant for easier implementation
        cell.FTag.text = "First Name: " + item.Fname!
        cell.STag.text = "Second Name: " + item.Sname!
        cell.PTag.text = "Phone Number: " + item.number! // outputting all the data
        cell.ETag.text = "Email: " + item.email!
        cell.DTag.text = "Description: " + item.desc!
        
        
        cell.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0) //colour of cells
        return(cell)//outputs the table
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180 // height of a cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "FnameLocal") as? String{
            postString = "Fname=\(x)"
        }
        if let z = UserDefaults.standard.object(forKey: "SnameLocal") as? String{
            postString = postString + "&Sname=\(z)"
        }
        if let y = UserDefaults.standard.object(forKey: "numberLocal") as? String{
            postString = postString + "&number=\(y)"
        }
        if let n = UserDefaults.standard.object(forKey: "emailLocal") as? String{
            postString = postString + "&email=\(n)"
        }
        if let i = UserDefaults.standard.object(forKey: "hasInputtedLocal") as? String{
            hasInputted = i //this is to recieve locally stored data, if used within ViewDidLoad crashes can occur
        }
        
        if let s = UserDefaults.standard.object(forKey: "descriptionLocal") as? String{
            if(includesDesc==1){
                postString = postString + "&description=\(s)"
            }
            else{
                postString = postString + "&description="
            }
        }
    }
    
    
    
    
    @IBAction func deleteDetails(_ sender: Any) {
        
        let checkDelete = UIAlertController(title: "Remove Details", message: "Are you sure you want to remove your details?", preferredStyle: UIAlertControllerStyle.alert)
        checkDelete.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))//pop up
        
        checkDelete.addAction(UIAlertAction(title: "Remove", style: UIAlertActionStyle.destructive, handler: { action in
            
            let url = URL(string: "http://tki.ifa.mybluehost.me/delteDetails.php")!//url
            var request = URLRequest(url: url)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")//way of transmitting data
            request.httpMethod = "POST"//type fo http method
            request.httpBody = self.postString.data(using: .utf8)//changing data so php can handle it
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 //check for fundamental networking error
                    print("error=\(error)")
                    return
                }
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           //check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(response)")
                }
                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(responseString)")
            }
            task.resume()
            
            hasInputted = "0"
            UserDefaults.standard.set(hasInputted, forKey: "hasInputtedLocal") //for validation
            
        }))
        
        let noDetails = UIAlertController(title: "Unable to delete", message: "You currently have no details stored", preferredStyle: UIAlertControllerStyle.alert)
        noDetails.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.cancel, handler: nil))//pop up
        

        
        if (hasInputted=="1") {
            self.present(checkDelete, animated: true, completion: nil)
        }
        else{
            self.present(noDetails, animated: true, completion: nil)
        }
        
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
