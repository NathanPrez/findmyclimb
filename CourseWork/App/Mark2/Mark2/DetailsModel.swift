//
//  DetailsModel.swift
//  Mark2
//
//  Created by Nathan Preston on 28/10/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit
import Foundation

class DetailsModel: NSObject {
    
    var Fname: String?
    var Sname: String?
    var number: String? //each piece of data declaration
    var email: String?
    var desc: String?
    
    override init(){
        
    }
    
    init(Fname: String, Sname: String, number: String, email: String, desc: String) {
        self.Fname = Fname
        self.Sname = Sname
        self.number = number
        self.email = email
        self.desc = desc
        
    }
    
    override var description: String {
        return "First Name: \(Fname), Second Name: \(Sname), Phone Number: \(number), Email: \(email), Description \(desc)"
    }
    
    
    
}
