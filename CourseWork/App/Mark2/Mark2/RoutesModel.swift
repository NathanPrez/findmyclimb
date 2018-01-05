//
//  RoutesModel.swift
//  Mark2
//
//  Created by Nathan Preston on 30/11/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit
import Foundation

class RoutesModel: NSObject {

    var grade: String?
    var location: String?
    var Rdesc: String?
    var ImageNum: String?//each piece of data declaration
    
    
    override init(){
        
    }
    
    init(grade: String, location: String, Rdesc: String, ImageNum:String) {
        self.grade = grade
        self.location = location
        self.Rdesc = Rdesc
        self.ImageNum = ImageNum
    }
    
    override var description: String {
        return "Location: \(location), Grade: \(grade), Description: \(Rdesc), ImageNum: \(ImageNum)"
    }
    

    
    
    
}
