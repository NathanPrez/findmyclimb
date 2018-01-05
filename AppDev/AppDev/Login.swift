//
//  ViewController.swift
//  AppDev
//
//  Created by Nathan Preston on 26/09/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit

var usernames = [String]()
var passwords = [String]()

class Login: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var passInput: UITextField!

    
    
    
    @IBAction func entry(_ sender: Any) {
        var i = 0
        let username = userInput.text
        let password = passInput.text
        
        while(i<usernames.count){
            if((usernames[i]==username)&&(passwords[i]==password)){
                performSegue(withIdentifier: "loginS", sender: self)
            }
            i = i+1
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.userInput.endEditing(true)
        self.passInput.endEditing(true)
    }
    
    func textFieldShouldReturn(_ userInput: UITextField) -> Bool {
        self.passInput.endEditing(true)
        self.userInput.endEditing(true)
        return false
    }
    
    

}


