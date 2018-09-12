//
//  myOtherCell.swift
//  myTodayNews
//
//  Created by yongzhen on 2018/9/11.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit

class myOtherCell: UITableViewCell, RegistCellFromNib {

    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBOutlet weak var rightImagView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
