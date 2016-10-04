//
//  Recipe.swift
//  Мои рецепты
//
//  Created by Nick on 02.10.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import Foundation
import CoreData

class Recipe: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var type: String
    @NSManaged var ingredient: String?
    @NSManaged var ingredintNum: String?
    @NSManaged var cooking: String?
    @NSManaged var note: String?
    @NSManaged var favorite: Bool
    @NSManaged var photo1: NSData?
    @NSManaged var photo2: NSData?
    @NSManaged var photo3: NSData?
    @NSManaged var photo4: NSData?
    @NSManaged var photo5: NSData?
    @NSManaged var photo6: NSData?
    @NSManaged var photo7: NSData?
    @NSManaged var photo8: NSData?
    @NSManaged var photo9: NSData?
    
}
