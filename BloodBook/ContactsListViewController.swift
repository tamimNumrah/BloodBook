//
//  ContactsListViewController.swift
//  BloodBook
//
//  Created by Tamim Ibn Aman on 6/30/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import UIKit
import Contacts
import CocoaLumberjack
class ContactsListViewController: UIViewController {
    @IBOutlet var contactsNavBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    var indicator = UIActivityIndicatorView()
    let contactListCellReuseIdentifier = "ContactListCell"
    var contacts:[CNContact] = [CNContact]()
    override func viewDidLoad() {
        super.viewDidLoad()
        DDLogInfo("ContactsListViewController viewDidLoad")
        activityIndicator()
        contacts = DeviceContacts.shared.contacts
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addContactPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "addContactViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    func showActivityIndicator() {
        if !indicator.isAnimating{
            print("Activity Indicator in ContactsViewController Showing")
            tableView.isScrollEnabled = false
            tableView.allowsSelection = false
            indicator.startAnimating()
            indicator.backgroundColor = UIColor.white
        }
    }
    
    func hideActivityIndicator() {
        if indicator.isAnimating{
            print("Activity Indicator in ContactsViewController hiding")
            tableView.isScrollEnabled = true
            tableView.allowsSelection = true
            indicator.stopAnimating()
            indicator.hidesWhenStopped = true
        }
    }


}
extension ContactsListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ContactListCellTableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: contactListCellReuseIdentifier) as? ContactListCellTableViewCell{
            cell = reuseCell
        }else{
            cell = ContactListCellTableViewCell(style: .default, reuseIdentifier: contactListCellReuseIdentifier)
        }
        let contactName:String? = ("\(contacts[indexPath.row].givenName) \(contacts[indexPath.row].familyName)")
        cell.ContactName?.text = contactName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "contactsDetailViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
