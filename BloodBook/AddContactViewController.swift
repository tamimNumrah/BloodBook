//
//  AddContactViewController.swift
//  BloodBook
//
//  Created by Tamim Ibn Aman on 7/2/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {

    @IBOutlet var AddContactTableView: UITableView!
    let formCellReuseIdentifier = "formInputCell"
    let addBloodGroupCellReuseIdentifier = "addBloodGroupCell"
    var addBloodGroupSection:Int?
    
    let bloodGroups = ["O Negative",
                "O Positive",
                "A Negative",
                "A Positive",
                "B Negative",
                "B Positive",
                "AB Negative",
                "AB Postive"]
    
    var selectedGroup: String?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }


}

extension AddContactViewController: UITableViewDelegate, UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if(indexPath.section == 0){
            var cell: FormInputTableViewCell
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: formCellReuseIdentifier) as? FormInputTableViewCell{
                cell = reuseCell
            }else{
                cell = FormInputTableViewCell(style: .default, reuseIdentifier: formCellReuseIdentifier)
            }
            cell.genericInputTextField.placeholder = "Generic Input"
            cell.genericLabel.text = "Generic Label"
            return cell;
        }else{
            var cell: AddBloodGroupTableViewCell
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: addBloodGroupCellReuseIdentifier) as? AddBloodGroupTableViewCell{
                cell = reuseCell
            }else{
                cell = AddBloodGroupTableViewCell(style: .default, reuseIdentifier: addBloodGroupCellReuseIdentifier)
            }
            addBloodGroupSection = indexPath.section
            cell.addBloodGroupTextField.textColor = UIColor.red
            if let select = selectedGroup{
                cell.addBloodGroupTextField.text = select;
            }
            
            //Create Picker View
            let dayPicker = UIPickerView()
            dayPicker.delegate = self
            dayPicker.tag = indexPath.row
            cell.addBloodGroupTextField.inputView = dayPicker
            
            //Create ToolBar
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
            
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissKeyboard))
            toolBar.setItems([doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            cell.addBloodGroupTextField.inputAccessoryView = toolBar
            
            return cell
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.AddContactTableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == addBloodGroupSection{
            let cell:AddBloodGroupTableViewCell = self.AddContactTableView.cellForRow(at: indexPath) as! AddBloodGroupTableViewCell
            cell.addBloodGroupTextField.becomeFirstResponder()
        }
    }
}

extension AddContactViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bloodGroups.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bloodGroups[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedGroup = bloodGroups[row]
        let cell:AddBloodGroupTableViewCell = self.AddContactTableView.cellForRow(at: IndexPath(row: pickerView.tag, section: addBloodGroupSection!)) as! AddBloodGroupTableViewCell
        let selects = selectedGroup
        DispatchQueue.main.async {
            cell.addBloodGroupTextField.text = selects
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .red
        label.textAlignment = .center
        label.font.withSize(17)
        
        label.text = bloodGroups[row]
        
        return label
    }
}
