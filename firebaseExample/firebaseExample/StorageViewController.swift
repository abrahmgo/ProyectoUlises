//
//  StorageViewController.swift
//  firebaseExample
//
//  Created by Andrés Bonilla Gómez on 09/05/22.
//

import Foundation
import UIKit
import FirebaseStorage

class StorageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upload()
    }
    
    @IBAction func uploadFile(_ sender: Any) {
    }
    
    func upload() {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let filePath = Bundle.main.path(forResource: "screen-0", ofType: "jpg")!
        let fileUrl = URL(fileURLWithPath: filePath)
        
        let riversRef = storageRef.child("images/universe.jpg")
        
        let uploadTask = riversRef.putFile(from: fileUrl, metadata: nil) { metadata, error in
          guard let metadata = metadata else {
              print(error)
            // Uh-oh, an error occurred!
            return
          }
            print("subiendo")
          // Metadata contains file metadata such as size, content-type.
          let size = metadata.size
          // You can also access to download URL after upload.
          riversRef.downloadURL { (url, error) in
            guard let downloadURL = url else {
                print(error)
              // Uh-oh, an error occurred!
              return
            }
              print("url de internet")
              print(url)
          }
        }
    }
}
