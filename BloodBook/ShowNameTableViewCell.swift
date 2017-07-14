//
//  ShowNameTableViewCell.swift
//  BloodBook
//
//  Created by Tamim Ibn Aman on 7/9/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import UIKit

class ShowNameTableViewCell: UITableViewCell {

    @IBOutlet var contactImage: UIImageView!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var bloodGroupLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
