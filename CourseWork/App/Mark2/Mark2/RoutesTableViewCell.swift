//
//  RoutesTableViewCell.swift
//  Mark2
//
//  Created by Nathan Preston on 30/11/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit

class RoutesTableViewCell: UITableViewCell {

    @IBOutlet weak var IGrade: UILabel!
    @IBOutlet weak var IAdd: UIButton!
    @IBOutlet weak var IDesc: UITextView!
    @IBOutlet weak var IPic: UIImageView!
    
    @IBOutlet weak var OGrade: UILabel!
    @IBOutlet weak var OAdd: UIButton!
    @IBOutlet weak var ODesc: UITextView!
    @IBOutlet weak var OPic: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
