//
//  NameInputTableViewCell.swift
//  BloodBook
//
//  Created by Tamim Ibn Aman on 7/8/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import UIKit

protocol NameInputTableViewCellDelegate: class {
    func nameInputImageView(_ cell: UITableViewCell, didPressImage: UIImageView)
}

class NameInputTableViewCell: UITableViewCell {

    @IBOutlet var contactsImage: UIImageView!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var firstNameTextView: UITextField!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var lastNameTextView: UITextField!
    
    weak var delegate: NameInputTableViewCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        contactsImage.isUserInteractionEnabled = true
        contactsImage.addGestureRecognizer(tapGestureRecognizer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        self.delegate?.nameInputImageView(self, didPressImage: tappedImage)
        
    }
}
