//
//  ContactsListViewController.swift
//  BloodBook
//
//  Created by Tamim Ibn Aman on 6/30/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import UIKit

class ContactsListViewController: UIViewController {
    @IBOutlet var contactsNavBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    let contactListCellReuseIdentifier = "ContactListCell"
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ContactsListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ContactListCellTableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: contactListCellReuseIdentifier) as? ContactListCellTableViewCell{
            cell = reuseCell
        }else{
            cell = ContactListCellTableViewCell(style: .default, reuseIdentifier: contactListCellReuseIdentifier)
        }
        cell.ContactName?.text = "This is Test"
        return cell;
    }
}
