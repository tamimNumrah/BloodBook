//
//  FormInputTableViewCell.swift
//  BloodBook
//
//  Created by Tamim Ibn Aman on 7/3/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import UIKit

class FormInputTableViewCell: UITableViewCell {

    @IBOutlet var genericLabel: UILabel!
    @IBOutlet var genericInputTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
