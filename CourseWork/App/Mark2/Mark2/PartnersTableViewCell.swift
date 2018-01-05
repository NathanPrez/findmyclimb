//
//  PartnersTableViewCell.swift
//  Mark2
//
//  Created by Nathan Preston on 14/10/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit

class PartnersTableViewCell: UITableViewCell {

    @IBOutlet weak var FTag: UILabel! //references
    @IBOutlet weak var STag: UILabel!
    @IBOutlet weak var PTag: UILabel!
    @IBOutlet weak var ETag: UILabel!
    @IBOutlet weak var DTag: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
