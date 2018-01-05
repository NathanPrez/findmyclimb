//
//  UploadRoute.swift
//  Mark2
//
//  Created by Nathan Preston on 28/11/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit

class UploadRoute: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate, UITextFieldDelegate, RoutesHomeModelProtocol {
    
    func itemsDownloaded(items: NSArray) {
        feedItems = items
    }
    

    var allLocations = ["Almscliff", "Anglezarke Quarry", "Avertical World", "Awesome Walls Sheffield", "Awesome Walls Stockport", "Awesome Walls Stoke", "Back Bowden Doors", "Beacon Climbing Centre", "Bear Rock Climbing", "Beinn Trilleachan", "Big Rock Climbing Centre", "Binnein Shuas crag", "Biscuit Factory Climbing", "Black Rocks", "Boulder Brighton", "Boulder Central", "Boulder Shack", "Boulders UK", "Brimham Rocks", "Brixton Recreation Centre", "Buachaille Etive Mor", "Carnmore Crag", "Castell y Gwynt", "Chee Dale", "Chimera Climbing Centre", "Clip N Climb Chelsea", "Clogwyn Du'r Arddu", "Clogwyn yr Eryr", "Craggy Island Bouldering", "Craggy Island Guildford", "Craig Bwlch y Moch", "Craig Pant Ifan", "Craig y Llam", "Creag Dubh Dibadale", "Creation Climbing Centre", "Cyrn Las", "Dinas Cromlech", "Dove Crag", "Dovestones Edge", "Dunkeld", "Dynamic Rock Swansea", "Eagle Crag", "Edinburgh International Climbing Arena", "Extreme Ventures Brighton", "Froggatt Edge", "Garbh Bheinn", "Glasgow Climbing Centre", "Gogarth Stack", "Harlech Climbing Wall", "High Sports Alton", "High Sports Brighton", "High Sports Crawley", "High Sports Plymouth", "Huddersfield Climbing Centre", "JAGS Sports Club", "KONG Adventure", "Kilnsey", "Lakeland Climbing Centre", "Lundy", "Malham Cove", "Manchester Climbing Centre", "Mile End Climbing Wall", "Millstone Edge", "Nottingham Climbing Centre", "Old Man of Hoy", "Old Man of Stoer", "Oxley Sports Centre", "Pavey Ark", "RGU: Sport", "Rainbow Slab Area", "Raven Tor", "Reading Climbing Centre", "Red Point Birmingham", "Red Spider", "Redpoint Bristol Climbing Centre", "Roaches Lower Tier", "Rock Antics Middlesbrough", "Rock Over Climbing", "Rock UK Summit Centre", "Rockstar Climbing Centre", "Scafell East Buttress", "Shelterstone Crag", "Shining Clough Rocks", "Showroom Climbing Centre", "Southampton Climbing Centre", "Spot Climbing Centre", "Sron Ulladale", "Sron na Ciche", "Stanage Plantation", "Sunderland Wall", "Swiss Cottage Climbing Centre", "The Arch Climbing Wall", "The Barn Climbing Centre", "The Boulder Bunker", "The Castle Climbing Centre", "The Climb", "The Climbing Hangar Liverpool", "The Climbing Hangar London", "The Climbing Unit", "The Depot Manchester", "The Depot Nottingham", "The Diamond", "The Dovestones Quarries", "The Foundry", "The Healthy Living Centre", "The Ice Factor", "The Indy Climbing Wall", "The Leeds Wall", "The Napes", "The North West Face Climbing Centre", "The Peak", "The Pinnacle Climbing Centre", "The Project Climbing Centre", "The Reach", "The Tower Climbing Centre", "The Undercover Rock", "The Warehouse Climbing", "Transition Extreme Sports", "Twll Mawr", "Uig Sea Cliffs", "Vauxhall Climbing Centre", "West 1 Climbing Wall", "West View Leisure Centre", "Westway Climbing", "White Spider", "Whitestone Cliffe", "Wimberry Rocks", "Wymondham Leisure Centre", "XC", "Yesnaby"]
    
    
    @IBOutlet weak var gradeInput: UITextField!
    @IBOutlet weak var centreList: UIPickerView!
    @IBOutlet weak var descInput: UITextView!
    @IBOutlet weak var centreTitle: UILabel!

    
    var locationInput = "", Dplaceholder = "Description (Such as the colour, quality of holds or tips)"
    var feedItems: NSArray = NSArray()//store objects
    var selectedDetail : RoutesModel = RoutesModel()//reference to ealier model
    
    override func viewDidLoad() {
        super.viewDidLoad()

        centreList.layer.cornerRadius = 10.0
        descInput.layer.cornerRadius = 10.0
        // Do any additional setup after loading the view.
        descInput.text = Dplaceholder
        descInput.textColor = UIColor.lightGray //description placeholder
        
        let routesHomeModel = RoutesHomeModel()//reference
        routesHomeModel.delegate = self
        routesHomeModel.downloadItems()//implements models protocol
    }
    
    @IBAction func input(_ sender: Any) {
        if(locationInput.count == 0){
            locationInput = "Almscliff"
        }
        
        var postString = "Location=\(locationInput)&Grade=\(gradeInput.text!)" //string POSTed to the php file
        if(descInput.text == Dplaceholder){
            postString = postString + "&Description="
        }
        else{
            postString = postString + "&Description=\(descInput.text!)"
        }
        
        postString = postString + "&ImageNum=\(feedItems.count + 1)"
        
        let info = UIAlertController(title: "Information", message: "Username: userPictureUpload@tki.ifa.mybluehost.me\nPassword: findmyclimb", preferredStyle: UIAlertControllerStyle.alert)
        info.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive, handler: { action in
            let url = URL(string: "https://cpanel-box5159.bluehost.com/cpsess1366992196/frontend/bluehost/filemanager/upload-ajax.html?file=&fileop=&dir=%2Fhome3%2Ftkiifamy%2Fpublic_html%2FuserPictureUpload&dirop=&charset=&file_charset=&baseurl=&basedir=")!
            UIApplication.shared.openURL(url)
        }))
        
        
        let uploadDetail = UIAlertController(title: "Upload a Picture", message: "Would you also like to include a picture", preferredStyle: UIAlertControllerStyle.alert)
        
        uploadDetail.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))//pop up
        
        uploadDetail.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive, handler: { action in
            self.present(info, animated: true, completion: nil)
        }))
        
        if((gradeInput.text?.count != 0)&&(descInput.text != Dplaceholder)){
            let url = URL(string: "http://tki.ifa.mybluehost.me/routeUpload.php")!//url
            var request = URLRequest(url: url)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")//way of transmitting data
            request.httpMethod = "POST"//type fo http method
            request.httpBody = postString.data(using: .utf8)//changing data so php can handle it
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
            
            self.present(uploadDetail, animated: true, completion: nil)
            performSegue(withIdentifier: "home", sender: self)
        }
        else{
            let invalid = UIAlertController(title: "Invalid", message: "Please add a grade and a descritpion, make sure youve selected a climbing centre", preferredStyle: UIAlertControllerStyle.alert)
            invalid.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.cancel, handler: nil))//pop up
            self.present(invalid, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return allLocations[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allLocations.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        locationInput = allLocations[row]
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if descInput.textColor == UIColor.lightGray { // if its the palceholder change to input
            descInput.text = nil
            descInput.textColor = UIColor.black
        }
        
        var frame = self.descInput.frame
        frame.origin.y = frame.origin.y - 195 //moving description box
        self.descInput.frame = frame
        
        centreList.isHidden = true
        gradeInput.isHidden = true
        centreTitle.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        var frame = self.descInput.frame
        frame.origin.y = frame.origin.y + 195 //putting description box back to original
        self.descInput.frame = frame
        
        
        if descInput.text.isEmpty {
            descInput.text = Dplaceholder
            descInput.textColor = UIColor.lightGray // placeholder
        }
        
        centreList.isHidden = false
        gradeInput.isHidden = false
        centreTitle.isHidden = false
    }
    
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.gradeInput.endEditing(true) //if you click away from keyboard, keyboard close
        self.descInput.endEditing(true)
    }
    
    func textFieldShouldReturn(_ gradeInput: UITextField) -> Bool {
        self.gradeInput.endEditing(true)
        return true
    }
    
    
    
    
    
}
