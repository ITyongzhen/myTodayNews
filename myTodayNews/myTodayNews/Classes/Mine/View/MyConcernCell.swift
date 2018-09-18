//
//  MyConcernCell.swift
//  myTodayNews
//
//  Created by yongzhen on 2018/9/14.
//  Copyright © 2018年 yongzhen. All rights reserved.
//

import UIKit
import Kingfisher
class MyConcernCell: UICollectionViewCell, RegistCellFromNib {
    // 头像
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var vipImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var tipsButton: UIButton!
    
    var myconcern : MyConcern?{
        didSet{
            avatarImageView.kf.setImage(with: URL(string: (myconcern?.icon)!))
            nameLabel.text = myconcern?.name
            vipImageView.isHidden = !(myconcern?.is_verify)!
            tipsButton.isHidden = !(myconcern?.tips)!
            vipImageView.image = myconcern?.user_auth_info.auth_type == 1 ? UIImage(named: "all_v_avatar_star_16x16_") : UIImage(named: "all_v_avatar_18x18_")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tipsButton.layer.borderWidth = 1
        tipsButton.layer.theme_borderColor = "colors.cellBackgroundColor"
        theme_backgroundColor = "colors.cellBackgroundColor"
        tipsButton.theme_backgroundColor = "colors.globalRedColor"
        nameLabel.theme_textColor = "colors.black"
    }


    
}
