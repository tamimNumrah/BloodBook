//
//  BloodBookTableViewCell.swift
//  BloodBook
//
//  Created by Tamim Ibn Aman on 6/30/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import UIKit

class BloodBookTableViewCell: UITableViewCell {

    @IBOutlet var ContactImage: UIImageView?
    @IBOutlet var firstName: UILabel?
    @IBOutlet var lastName: UILabel?
    @IBOutlet var PhoneNumber: UILabel?
    @IBOutlet var dialButton: UIButton?
    @IBOutlet var smsButton: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func dialButtonPressed(_ sender: Any) {
        var telNumber: String = "tel://"
        telNumber.append((PhoneNumber?.text)!)
        let url:URL = URL.init(string: telNumber)!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    @IBAction func smsButtonPressed(_ sender: Any) {
        var telNumber: String = "sms:"
        telNumber.append((PhoneNumber?.text)!)
        let url:URL = URL.init(string: telNumber)!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
