//
//  ViewController.swift
//  camera
//
//  Created by Andrés Bonilla Gómez on 01/05/22.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    private var currentImage: UIImage?
    private let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
    }

    @IBAction func takePicture(_ sender: Any) {
        
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func takeLibrary(_ sender: Any) {
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        currentImage = image
        imageView.image = image
    }
    
    @IBAction func filterImage(_ sender: Any) {
        let filter = FilterType.allCases.randomElement() ?? .mono
        imageView.image = currentImage?.addFilter(filter: filter)
    }
    
    @IBAction func saveImage(_ sender: Any) {
        guard let image = currentImage,
              let data = image.jpegData(compressionQuality: 1) else {
            print("No tienes una imagen para guardar")
            return
        }
        
        RealmData.shared.delete()
        
        RealmData.shared.write(image: data)
        print("Guardado exitoso")
    }
    
    @IBAction func restoreImage(_ sender: Any) {
        guard let imageData = RealmData.shared.read() else {
            print("No hay imagen previamente guardada")
            return
        }
        
        print("Imagen restaurada con exito")
        imageView.image = UIImage(data: imageData)
    }
}
