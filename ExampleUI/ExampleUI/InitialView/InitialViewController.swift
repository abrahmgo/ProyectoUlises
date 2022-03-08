//
//  InitialViewController.swift
//  ExampleUI
//
//  Created by Andrés Bonilla Gómez on 16/02/22.
//

import UIKit
import CoreData

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        MainUserDefaults.volume = 50
//        MainUserDefaults.isSplash = true
//        let volumeStatus = MainUserDefaults.volume
//        print(volumeStatus)
        
        // obtener la tabla
//        let context = CoreData.shared.persistentContainer.viewContext
        // obtener el objeto a guardar
//        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        // creamos el objeto a guardar
//        let newUser = NSManagedObject(entity: entity!, insertInto: context)

        // insertamos
//        newUser.setValue("Test", forKey: "name")
//        newUser.setValue(1, forKey: "id")
//        newUser.setValue("Perez", forKey: "lastName")
//        newUser.setValue(34, forKey: "age")

        // guardamos
//        CoreData.shared.saveContext()
        
        // realm
        let stores = MainRealm.shared.read(object: Furniture.self)
        print(stores)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            // obtenemos
//            CoreData.shared.getContext(entity: "User")
            // eliminar
//            CoreData.shared.deleteContext(entity: "User")
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @IBAction func goToSecondView(_ sender: Any) {
        let viewControllerWithCode = CollectionViewController(nibName: "CollectionViewController", bundle: nil)
        navigationController?.pushViewController(viewControllerWithCode, animated: true)
    }
}
