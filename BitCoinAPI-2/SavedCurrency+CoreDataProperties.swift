//
//  SavedCurrency+CoreDataProperties.swift
//  BitCoinAPI
//
//  Created by Ahsan on 10/12/2021.
//
//

import Foundation
import CoreData


extension SavedCurrency {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedCurrency> {
        return NSFetchRequest<SavedCurrency>(entityName: "SavedCurrency")
    }

    @NSManaged public var cSymbol: String?
    @NSManaged public var rate: Double

}

extension SavedCurrency : Identifiable {

}
