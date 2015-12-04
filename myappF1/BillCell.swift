//
//  BillCell.swift
//  myappF1
//
//  Created by 吴昊 on 5/11/15.
//  Copyright (c) 2015 吴昊. All rights reserved.
//

import UIKit

class BillCell: UITableViewCell {
   
    @IBOutlet var frontImg: UIImageView!
    @IBOutlet var labelC: UILabel!
    @IBOutlet var labelD: UILabel!
    @IBOutlet var labelA: UILabel!
    @IBOutlet var backImg: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
}
