//
//  TagCell.swift
//  tlvparse
//
//  Created by Alberto Ortiz on 4/16/18.
//  Copyright © 2018 Alberto Ortiz. All rights reserved.
//

import UIKit

class TagCell: UITableViewCell {

    @IBOutlet weak var lblTag: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
