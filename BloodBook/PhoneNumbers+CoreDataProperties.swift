//
//  PhoneNumbers+CoreDataProperties.swift
//  BloodBook
//
//  Created by Tamim Ibn Aman on 7/17/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import Foundation
import CoreData


extension PhoneNumbers {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneNumbers> {
        return NSFetchRequest<PhoneNumbers>(entityName: "PhoneNumbers")
    }

    @NSManaged public var phone_number: String?
    @NSManaged public var parent_contact: ContactsInformation?

}
