//
//  Upload.swift
//  Mark2
//
//  Created by Nathan Preston on 14/10/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit

var includesDesc=0 // initialisation

class Upload: UIViewController, UITextViewDelegate, UITextFieldDelegate {


    @IBOutlet weak var invalid: UITextView!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var snameInput: UITextField!
    @IBOutlet weak var numberInput: UITextField! //references
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var descInput: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        descInput.delegate = self
        
        descInput.text = "Description"
        descInput.textColor = UIColor.lightGray //description placeholder
        
        descInput.clipsToBounds = true
        descInput.layer.cornerRadius = 10.0//making curved edges
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if descInput.textColor == UIColor.lightGray { // if its the palceholder change to input
            descInput.text = nil
            descInput.textColor = UIColor.black
        }
        var frame = self.descInput.frame
        frame.origin.y = frame.origin.y - 175 //moving description box
        self.descInput.frame = frame
        
        nameInput.isHidden = true
        emailInput.isHidden = true
    }
   
    func textViewDidEndEditing(_ textView: UITextView) {
        var frame = self.descInput.frame
        frame.origin.y = frame.origin.y + 175 //putting description box back to original
        self.descInput.frame = frame
        
        
        if descInput.text.isEmpty {
            descInput.text = "Description"
            descInput.textColor = UIColor.lightGray // placeholder
        }
        
        nameInput.isHidden = false
        emailInput.isHidden = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
      
    
    @IBAction func input(_ sender: Any) {
        
        
        
        
        let Fname = nameInput.text
        let Sname = snameInput.text
        let number = numberInput.text //changing refernces to variables
        let email = emailInput.text
        let description = descInput.text
        var unique = 0, loop = 0, loopE = 0, includesChar = 0, postString = ""
        
        
        while((number?.count != 0)&&(loop<numbers.count)){
            if(number == numbers[loop]){
                unique = 1
                loop = numbers.count // checking if the number is unique
            }
            loop = loop + 1
        }
        
        
        while(loopE<emails.count){
            if((email?.count != 0)&&(email == emails[loopE])){
                unique = 1
                loopE = emails.count //checking if email is unique
            }
            loopE = loopE + 1
        }
        
        
        if((email?.count != 0)&&(email!.contains("@"))){
            includesChar = 1
        }
        else if(email?.count == 0){ // checking if the email includes the @ symbol
            includesChar = 1
        }
 
        
        if((Fname?.count != 0)&&((number?.count != 0)||(email?.count != 0))){ // validation
            if((unique==0)&&(includesChar==1)&&(hasInputted=="0")){
                
                postString = "Fname=\(Fname!)&Sname=\(Sname!)&number=\(number!)&email=\(email!)"
                //string POSTed to the php file
                
                if(description != "Description"){ //need an extra if statement due to placeholder
                    postString = postString + "&description=\(description!)" //adds the input
                    includesDesc = 1
                }
                else{
                    postString = postString + "&description="//if no input, nothing is added
                }
                invalid.textColor = UIColor.lightGray
                
                let url = URL(string: "http://tki.ifa.mybluehost.me/testing.php")!//url
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
                
                UserDefaults.standard.set(Fname, forKey: "FnameLocal")
                UserDefaults.standard.set(Sname, forKey: "SnameLocal")
                UserDefaults.standard.set(number, forKey: "numberLocal") //storing data locally
                UserDefaults.standard.set(email, forKey: "emailLocal")
                UserDefaults.standard.set(description, forKey: "descriptionLocal")
                
                hasInputted = "1"
                UserDefaults.standard.set(hasInputted, forKey: "hasInputtedLocal") //for validation 
                
                
                performSegue(withIdentifier: "detailSeg", sender: self) // perform segue to the Partners page
            }
            else{
                invalid.textColor = UIColor.red
            }
        }                                           // if invalid input text color goes red for indication
        else{
            invalid.textColor = UIColor.red
        }
    }

    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.nameInput.endEditing(true)
        self.snameInput.endEditing(true)
        self.numberInput.endEditing(true) //if you click away from keyboard, keyboard closes
        self.emailInput.endEditing(true)
        self.descInput.endEditing(true)
    }
    
    func textFieldShouldReturn(_ nameInput: UITextField) -> Bool {
        self.nameInput.endEditing(true)
        self.snameInput.endEditing(true)
        self.numberInput.endEditing(true) // if you click enter keyboard closes
        self.emailInput.endEditing(true)
        return true 
    }

}
