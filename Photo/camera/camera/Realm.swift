//
//  Realm.swift
//  camera
//
//  Created by Andrés Bonilla Gómez on 12/05/22.
//

import Foundation
import RealmSwift

class Picture: Object {
    @objc dynamic var image = Data()
    
    static func create(image: Data) -> Picture {
        let picture = Picture()
        picture.image = image
        
        return picture
    }
}

class RealmData {
    
    static let shared = RealmData()
    
    lazy var realm: Realm = {
        return try! Realm(configuration: .defaultConfiguration)
    }()
    
    func write(image: Data) {
        let picture = Picture.create(image: image)
        
        // Write to Realm
        print("Write to Realm")
        try! realm.write {
            realm.add(picture)
        }
    }
    
    func read() -> Data? {
        // Read from Realm
        print("Read from Realm")
        let data = realm.objects(Picture.self)
        let imageData = data.first?.image
        return imageData
    }
    
    func delete() {
        let objectsToDelete = realm.objects(Picture.self)
        try! realm.write {
            realm.delete(objectsToDelete)
        }
    }
}
