//
//  Bills.swift
//  myappF1
//
//  Created by 吴昊 on 5/6/15.
//  Copyright (c) 2015 吴昊. All rights reserved.
//

import Foundation
import CoreData

class Bills: NSManagedObject {

    @NSManaged var amount: NSNumber
    @NSManaged var category: String
    @NSManaged var ctime: NSDate
    @NSManaged var memo: String
    @NSManaged var type: NSNumber

}
