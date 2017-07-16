//
//  ContactsDetailTableViewController.swift
//  BloodBook
//
//  Created by Tamim Ibn Aman on 7/9/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import UIKit
import CocoaLumberjack
import Contacts



class ContactsDetailTableViewController: UITableViewController {
    let nameCellReuseIdentifier = "showNameCell"
    let bloodGroupCellReuseIdentifier = "showBloodGroupCell"
    let phoneNumberCellReuseIdentifier = "showPhoneNumberCell"
    var viewedContact: CNContact?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contact = viewedContact{
            self.title = contact.givenName + " " + contact.familyName
            DDLogInfo("Contact Loaded in ContactDetailViewController")
        }else{
            self.title = "New"
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Edit", style: .plain, target: self, action: #selector(editButtonPressed))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func editButtonPressed(){
        DDLogInfo("editButtonPressed in ContactsDetailViewController")
    }
}

extension ContactsDetailTableViewController{
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2{
            if let count = viewedContact?.phoneNumbers.count{
                return count
            }
            return 1
        }
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 120
        }else if indexPath.section == 1{
            return 100
        }else{
            return 44
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            var cell: ShowBloodGroupTableViewCell
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: bloodGroupCellReuseIdentifier) as? ShowBloodGroupTableViewCell{
                cell = reuseCell
            }else{
                cell = ShowBloodGroupTableViewCell(style: .default, reuseIdentifier: bloodGroupCellReuseIdentifier)
            }
            return cell
        }else if indexPath.section == 1{
            var cell: ShowNameTableViewCell
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: nameCellReuseIdentifier) as? ShowNameTableViewCell{
                cell = reuseCell
            }else{
                cell = ShowNameTableViewCell(style: .default, reuseIdentifier: nameCellReuseIdentifier)
            }
            cell.firstNameLabel.text = viewedContact?.givenName
            cell.lastNameLabel.text = viewedContact?.familyName
            if let data = viewedContact?.imageData {
                cell.contactImage.image = UIImage(data: data)
            }
            return cell
        }else{
            var cell: ShowPhoneNumberTableViewCell
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: phoneNumberCellReuseIdentifier) as? ShowPhoneNumberTableViewCell{
                cell = reuseCell
            }else{
                cell = ShowPhoneNumberTableViewCell(style: .default, reuseIdentifier: phoneNumberCellReuseIdentifier)
            }
            let phoneNumbers = viewedContact?.phoneNumbers
            let phoneNumber = phoneNumbers?[indexPath.row]
            if let phone =  phoneNumber{
                let number = phone.value
                cell.phoneNumberLabel.text = number.stringValue
            }
            
            
            return cell
        }
    }
    
}

