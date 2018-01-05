//
//  PlacesTableViewCell.swift
//  Mark2
//
//  Created by Nathan Preston on 15/10/2017.
//  Copyright © 2017 Nathan Preston. All rights reserved.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {

    @IBOutlet weak var OutdoorTag: UILabel! // references
    
    @IBOutlet weak var IndoorTag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
