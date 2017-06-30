//
//  SettingsViewController.swift
//  BloodBook
//
//  Created by Tamim Ibn Aman on 6/30/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var settingsNavBar: UINavigationBar!
    @IBOutlet var settingsTableView: UITableView!
    let settingsCellReuseIdentifier = "SettingsCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: SettingsTableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: settingsCellReuseIdentifier) as? SettingsTableViewCell{
            cell = reuseCell
        }else{
            cell = SettingsTableViewCell(style: .default, reuseIdentifier: settingsCellReuseIdentifier)
        }
        //cell.ContactName?.text = "This is Test"
        return cell;
    }
}

