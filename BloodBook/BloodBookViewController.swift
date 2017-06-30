//
//  BloodBookViewController.swift
//  BloodBook
//
//  Created by Tamim Ibn Aman on 6/30/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import UIKit

class BloodBookViewController: UIViewController {
    @IBOutlet var bloodBookTableView: UITableView!
    @IBOutlet var bloodBookNavBar: UINavigationBar!
    let bloodBookCellReuseIdentifier = "BloodBookCell"
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
extension BloodBookViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: BloodBookTableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: bloodBookCellReuseIdentifier) as? BloodBookTableViewCell{
            cell = reuseCell
        }else{
            cell = BloodBookTableViewCell(style: .default, reuseIdentifier: bloodBookCellReuseIdentifier)
        }
        cell.firstName?.text = "Tamim"
        cell.lastName?.text = "Ibn Amanqwefqweqweqwedqew"
        cell.PhoneNumber?.text = "+8801829260190fdfwqfwd"
        return cell;
    }
}


