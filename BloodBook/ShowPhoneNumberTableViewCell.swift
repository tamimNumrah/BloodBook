//
//  ShowPhoneNumberTableViewCell.swift
//  BloodBook
//
//  Created by Tamim Ibn Aman on 7/9/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import UIKit

class ShowPhoneNumberTableViewCell: UITableViewCell {

    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var smsButton: UIButton!
    
    @IBOutlet var dialButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func smsButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func dialButtonPressed(_ sender: UIButton) {
    }

}
