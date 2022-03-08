//
//  MainRealm.swift
//  ExampleUI
//
//  Created by Andrés Bonilla Gómez on 07/03/22.
//

import Foundation
import RealmSwift

class Furniture: Object {
    @objc dynamic var name = ""
    
    static func create(withName name: String) -> Furniture {
        let furniture = Furniture()
        furniture.name = name
        
        return furniture
    }
}

class Store: Object {
    @objc dynamic var name = ""
    var furniture = List<Furniture>()

    static func create(withName name: String,
                       furniture: [Furniture]) -> Store {
        let store = Store()
        store.name = name
        store.furniture.append(objectsIn: furniture)

        return store
    }
}

class MainRealm {
    
    static let shared = MainRealm()
    
    lazy var realm: Realm = {
        return try! Realm(configuration: .defaultConfiguration)
    }()
    
    func write(objectToSave: Object) {
        
        // Write to Realm
        print("Write to Realm")
        try! realm.write {
            realm.add(objectToSave)
        }
    }
    
    func read(object: Object.Type) -> Results<Object> {
        
        let data = realm.objects(object)
        return data
    }
    
    // investigar como eliminar
    
}
