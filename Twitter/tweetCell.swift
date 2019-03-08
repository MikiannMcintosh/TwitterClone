//
//  tweetCell.swift
//  Twitter
//
//  Created by Mikiann Mcintosh on 3/7/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class tweetCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
