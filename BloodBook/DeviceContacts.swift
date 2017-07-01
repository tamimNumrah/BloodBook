//
//  DeviceContacts.swift
//  BloodBook
//
//  Created by Tamim Ibn Aman on 7/1/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import Foundation
import Contacts
final class DeviceContacts{
    
    var contacts:[CNContact] = [CNContact]()
    var contactStore: CNContactStore = CNContactStore()
    var isContactsFetching = false
    static let shared = DeviceContacts()
    
    private init(){
        print("DeviceContacts Initialized")
    }
    
    func loadContacts() -> Void{
        AppDelegate.getAppDelegate().requestForContactAccess(completionHandler: {
            accessGranted in
            self.isContactsFetching = true;
            self.contacts = [CNContact]()
            if(accessGranted){
                let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
                let request = CNContactFetchRequest(keysToFetch: keys)
                do {
                    try self.contactStore.enumerateContacts(with: request) {
                        (contact, stop) in
                        self.contacts.append(contact)
                    }
                } 
                catch {
                    print("unable to fetch contacts")
                }
            }else {

            }
            self.isContactsFetching = false
        })
    }
}
