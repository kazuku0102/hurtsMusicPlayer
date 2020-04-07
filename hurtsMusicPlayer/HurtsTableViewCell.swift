//
//  HurtsTableViewCell.swift
//  hurtsMusicPlayer
//
//  Created by 蕭聿莘 on 2020/4/1.
//  Copyright © 2020 Kazuku. All rights reserved.
//

import UIKit

class HurtsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
