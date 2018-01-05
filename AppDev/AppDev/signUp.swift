//
//  ViewController.swift
//  AppDev
//
//  Created by Nathan Preston on 03/10/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit

class signUp: UIViewController, UITextFieldDelegate {
    
    var x = 0
    
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput1: UITextField!
    @IBOutlet weak var passwordInput2: UITextField!

    
    
    
    @IBAction func enterDetails(_ sender: Any) {
        let usernameNew = usernameInput.text
        let passwordNew = passwordInput1.text
        if(passwordInput1.text == passwordInput2.text){
            
            let postString = "Username=\(usernameNew!)&Password=\(passwordNew!)"
            
            let url = URL(string: "http://tki.ifa.mybluehost.me/signUp.php")!//url
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
            
            x = x+1
            performSegue(withIdentifier: "signupS", sender: self)
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
        self.usernameInput.endEditing(true)
        self.passwordInput1.endEditing(true)
        self.passwordInput2.endEditing(true)
    }
    
    func textFieldShouldReturn(_ usernameInput: UITextField) -> Bool {
        self.passwordInput1.endEditing(true)
        self.passwordInput2.endEditing(true)
        self.usernameInput.endEditing(true)
        return false
    }
    


}
