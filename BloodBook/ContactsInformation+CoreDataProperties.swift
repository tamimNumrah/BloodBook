//
//  ContactsInformation+CoreDataProperties.swift
//  BloodBook
//
//  Created by Tamim Ibn Aman on 7/17/17.
//  Copyright © 2017 Tamim Ibn Aman. All rights reserved.
//

import Foundation
import CoreData


extension ContactsInformation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactsInformation> {
        return NSFetchRequest<ContactsInformation>(entityName: "ContactsInformation")
    }

    @NSManaged public var first_name: String?
    @NSManaged public var last_name: String?
    @NSManaged public var image_data: NSData?
    @NSManaged public var from_remote: Bool
    @NSManaged public var sent_to_remote: Bool
    @NSManaged public var blood_group: String?
    @NSManaged public var phone_numbers_list: NSSet?

}

// MARK: Generated accessors for phone_numbers_list
extension ContactsInformation {

    @objc(addPhone_numbers_listObject:)
    @NSManaged public func addToPhone_numbers_list(_ value: PhoneNumbers)

    @objc(removePhone_numbers_listObject:)
    @NSManaged public func removeFromPhone_numbers_list(_ value: PhoneNumbers)

    @objc(addPhone_numbers_list:)
    @NSManaged public func addToPhone_numbers_list(_ values: NSSet)

    @objc(removePhone_numbers_list:)
    @NSManaged public func removeFromPhone_numbers_list(_ values: NSSet)

}
