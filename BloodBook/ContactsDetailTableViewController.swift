//
//  ContactsDetailTableViewController.swift
//  BloodBook
//
//  Created by Tamim Ibn Aman on 7/9/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import UIKit

class ContactsDetailTableViewController: UITableViewController {
    let nameCellReuseIdentifier = "showNameCell"
    let bloodGroupCellReuseIdentifier = "showBloodGroupCell"
    let phoneNumberCellReuseIdentifier = "showPhoneNumberCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ContactsDetailTableViewController{
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
            return cell
        }else{
            var cell: ShowPhoneNumberTableViewCell
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: phoneNumberCellReuseIdentifier) as? ShowPhoneNumberTableViewCell{
                cell = reuseCell
            }else{
                cell = ShowPhoneNumberTableViewCell(style: .default, reuseIdentifier: phoneNumberCellReuseIdentifier)
            }
            return cell
        }
    }
    
}

