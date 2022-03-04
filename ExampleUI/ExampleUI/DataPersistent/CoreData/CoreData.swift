//
//  CoreData.swift
//  ExampleUI
//
//  Created by Andrés Bonilla Gómez on 02/03/22.
//

import CoreData
import Foundation

class CoreData {
    
    // singleton
    static let shared = CoreData()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "User")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext() {
        print("saving")
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getContext(entity: String) {
        print("Fetching Data..")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        //filtros, peronas > 24, nombre empiece con A // filtros
        request.returnsObjectsAsFaults = false
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            for data in result as! [NSManagedObject] {
                // imprime todas las columnas
                dump(data)
                // imprime una columna
                dump(data.value(forKey: "id") as? Int ?? 0)
            }
        } catch {
            print("Fetching data Failed")
        }
    }
    
    func deleteContext(entity: String) {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        request.returnsObjectsAsFaults = false
        do {
            let result = try persistentContainer.viewContext.fetch(request)
            for data in result as! [NSManagedObject] {
                persistentContainer.viewContext.delete(data)
            }
            
            try persistentContainer.viewContext.save()
        } catch {
            print("Fetching data Failed")
        }
    }
}
