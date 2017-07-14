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
    let nameInputCellReuseIdentifier = "nameInputCell"
    var addBloodGroupSection:Int?
    
    let imagePicker = UIImagePickerController()
    var selectedImage: UIImage?
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
        imagePicker.delegate = self;
        registerForKeyboardNotifications()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlertForSelectingImage(){
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let choosePhotoAction = UIAlertAction(title: "Choose Photo", style: .default, handler: openPickerController)
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: openCamera)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(takePhotoAction)
        alertController.addAction(choosePhotoAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        

    }
    private func openPickerController(alert: UIAlertAction!){
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .savedPhotosAlbum
        self.present(imagePicker, animated: true, completion: nil)
    }
    private func openCamera(alert: UIAlertAction!){
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        imagePicker.cameraCaptureMode = .photo
        self.present(imagePicker, animated: true, completion: nil)
    }
    
   
}
extension AddContactViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        /*
         // Determine the row number of the active UITextField in which "return" was just pressed.
         id cellContainingFirstResponder = textField.superview.superview ;
         NSInteger rowOfCellContainingFirstResponder = [self.tableView indexPathForCell:cellContainingFirstResponder].row ;
         // Get a reference to the next cell.
         NSIndexPath* indexPathOfNextCell = [NSIndexPath indexPathForRow:rowOfCellContainingFirstResponder+1 inSection:0] ;
         TableViewCell* nextCell = (TableViewCell*)[self.tableView cellForRowAtIndexPath:indexPathOfNextCell] ;
         if ( nextCell )
         [nextCell.theTextField becomeFirstResponder] ;
         else
         [textField resignFirstResponder] ;
         */
        return true
    }
    func registerForKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notification: Notification){
        if let userInfo = notification.userInfo {
            let keyboardSize: CGSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size
            let contentInset = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
            self.AddContactTableView.contentInset = contentInset
            self.AddContactTableView.scrollIndicatorInsets = contentInset
        }
        
    }
    func keyboardWillHide(notification: Notification){
        let contentInset = UIEdgeInsetsMake((self.navigationController?.navigationBar.layer.bounds.height)!, 0, 0, 0)
        self.AddContactTableView.contentInset = contentInset
        self.AddContactTableView.scrollIndicatorInsets = contentInset
    }
}

extension AddContactViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 130
        }else{
            return 44
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Personal Details"
        }else if section == 1{
            return "Contact Informations"
        }else if section == 2{
            return "Blood Information"
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if(indexPath.section == 0){
            var cell:NameInputTableViewCell
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: nameInputCellReuseIdentifier) as? NameInputTableViewCell{
                cell = reuseCell
            }else{
                cell = NameInputTableViewCell(style: .default, reuseIdentifier: nameInputCellReuseIdentifier)
            }
            if let image = selectedImage{
                 cell.contactsImage.image = image
            }else{
                cell.contactsImage.image = UIImage(named: "insert_PP.png")
            }
            cell.firstNameLabel.textColor = UIColor.red
            cell.lastNameLabel.textColor = UIColor.red
            cell.firstNameTextView.delegate = self
            cell.lastNameTextView.delegate = self
            cell.delegate = self
            return cell
        }else if indexPath.section == 1{
            var cell: FormInputTableViewCell
            if let reuseCell = tableView.dequeueReusableCell(withIdentifier: formCellReuseIdentifier) as? FormInputTableViewCell{
                cell = reuseCell
            }else{
                cell = FormInputTableViewCell(style: .default, reuseIdentifier: formCellReuseIdentifier)
            }
            cell.genericInputTextField.placeholder = "1234567890"
            cell.genericInputTextField.keyboardType = .phonePad
            cell.genericLabel.text = "Phone Number"
            cell.genericLabel.textColor = UIColor.red
            return cell
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.AddContactTableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == addBloodGroupSection{
            let cell:AddBloodGroupTableViewCell = self.AddContactTableView.cellForRow(at: indexPath) as! AddBloodGroupTableViewCell
            cell.addBloodGroupTextField.becomeFirstResponder()
        }
    }
}

extension AddContactViewController:NameInputTableViewCellDelegate{
    func nameInputImageView(_ cell: UITableViewCell, didPressImage: UIImageView) {
       showAlertForSelectingImage()
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


extension AddContactViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
        selectedImage = chosenImage
        // use the image
        print("didFinishPickingMediaWithInfo \(info)")
        
        self.AddContactTableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)//because the image is in row 0 section 0
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
