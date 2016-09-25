//
//  banksTableViewCell.swift
//  vismoney
//
//  Created by Yeon Joon Choi on 9/24/16.
//  Copyright © 2016 Yeon Joon Choi. All rights reserved.
//

import UIKit

class banksTableViewCell: UITableViewCell {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var bank: UILabel!
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
