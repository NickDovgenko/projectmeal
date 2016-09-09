//
//  CreatingRecipeController.swift
//  Мои рецепты
//
//  Created by Nick on 04.09.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class CreatingRecipeController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageNum = 0
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var newImage2: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        //Actions
    
    @IBAction func recipeSave(sender: UIBarButtonItem)
    {
        
    }
        // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func imagePick(sender: UITapGestureRecognizer) {
        
        self.imageImport()
        imageNum = 1

    }
    @IBAction func imagePickTwo(sender: UITapGestureRecognizer) {
        
        self.imageImport()
        imageNum = 2
    }
    
    func imageImport() {
        let imagePickerControllerFirst = UIImagePickerController()
        imagePickerControllerFirst.sourceType = .PhotoLibrary
        imagePickerControllerFirst.delegate = self
        imagePickerControllerFirst.allowsEditing = true
        presentViewController(imagePickerControllerFirst, animated: true, completion: nil)
        // Спрятать клавиатуру
        //nameTextField.resignFirstResponder()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // The info dictionary contains multiple representations of the image, and this uses the original.
        let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage
        
        if imageNum == 1 {
            newImage.image = pickedImage
        } else if imageNum == 2 {
            newImage2.image = pickedImage
        }
            // Dismiss the picker.
            dismissViewControllerAnimated(true, completion: nil)
    
    
    }
    
    
}