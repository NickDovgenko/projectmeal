//
//  DetailViewController.swift
//  Мои рецепты
//
//  Created by Nick on 10.10.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageNum = 0
    var keyBoardCount = 0
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var recipeType: UILabel!
    @IBOutlet weak var photo1: UIImageView!
    @IBOutlet weak var photo2: UIImageView!
    @IBOutlet weak var photo3: UIImageView!
    @IBOutlet weak var photo4: UIImageView!
    @IBOutlet weak var photo5: UIImageView!
    @IBOutlet weak var photo6: UIImageView!
    @IBOutlet weak var photo7: UIImageView!
    @IBOutlet weak var photo8: UIImageView!
    @IBOutlet weak var photo9: UIImageView!
    @IBOutlet weak var mealIngredients: UITextView!
    @IBOutlet weak var mealIngredientsNum: UITextView!
    @IBOutlet weak var preparingMeal: UITextView!
    @IBOutlet weak var mealNotes: UITextView!
    @IBOutlet weak var toolBar: UIToolbar!
    
    var recipe = [NSManagedObject]()
    var recievedData: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        //Dismiss keyboard
        self.hideKeyboardWhenTappedAround()
        
        //Рамки текстовых полей
        preparingMeal.layer.borderColor = UIColor.white.cgColor
        preparingMeal.layer.borderWidth = 1.0
        preparingMeal.layer.cornerRadius = 5
        
        mealNotes.layer.borderColor = UIColor.white.cgColor
        mealNotes.layer.borderWidth = 1.0
        mealNotes.layer.cornerRadius = 5
        
        mealIngredients.layer.borderColor = UIColor.white.cgColor
        mealIngredients.layer.borderWidth = 1.0
        mealIngredients.layer.cornerRadius = 5
        
        mealIngredientsNum.layer.borderColor = UIColor.white.cgColor
        mealIngredientsNum.layer.borderWidth = 1.0
        mealIngredientsNum.layer.cornerRadius = 5
        
        
        //Вывод фото и текста
        self.photo1.image = UIImage(data: recievedData[0].photo1 as! Data)
        photo1.layer.cornerRadius = 20
        photo1.clipsToBounds = true
        self.photo2.image = UIImage(data: recievedData[0].photo2 as! Data)
        photo2.layer.cornerRadius = 20
        photo2.clipsToBounds = true
        self.photo3.image = UIImage(data: recievedData[0].photo3 as! Data)
        photo3.layer.cornerRadius = 20
        photo3.clipsToBounds = true
        self.photo4.image = UIImage(data: recievedData[0].photo4 as! Data)
        photo4.layer.cornerRadius = 20
        photo4.clipsToBounds = true
        self.photo5.image = UIImage(data: recievedData[0].photo5 as! Data)
        photo5.layer.cornerRadius = 20
        photo5.clipsToBounds = true
        self.photo6.image = UIImage(data: recievedData[0].photo6 as! Data)
        photo6.layer.cornerRadius = 20
        photo6.clipsToBounds = true
        self.photo7.image = UIImage(data: recievedData[0].photo7 as! Data)
        photo7.layer.cornerRadius = 20
        photo7.clipsToBounds = true
        self.photo8.image = UIImage(data: recievedData[0].photo8 as! Data)
        photo8.layer.cornerRadius = 20
        photo8.clipsToBounds = true
        self.photo9.image = UIImage(data: recievedData[0].photo9 as! Data)
        photo9.layer.cornerRadius = 20
        photo9.clipsToBounds = true
        
        
        
        self.navigationItem.title = recievedData[0].name
        self.recipeType?.text = recievedData[0].type
        self.mealIngredients?.text = recievedData[0].ingredient
        self.mealIngredientsNum?.text = recievedData[0].ingredintNum
        self.preparingMeal?.text = recievedData[0].cooking
        self.mealNotes?.text = recievedData[0].note
        
        print("Массив", recievedData)
   
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.rightBarButtonItem = editButtonItem
        
    }
    
    func keyboardWillShow(notification:NSNotification) {
        
        keyBoardCount += 1
        if keyBoardCount <= 1 {
            
            ViewUpanimateMoving(up: true, upValue: 150)
            var userInfo = notification.userInfo!
            var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)
            
            var contentInset: UIEdgeInsets = self.scrollView.contentInset
            contentInset.bottom = self.scrollView.contentInset.bottom
            self.scrollView.contentInset = contentInset
        }
        else {
            keyBoardCount -= 1
        }
        // print(keyBoardCount)
        
    }
    
    func keyboardWillHide(notification:NSNotification) {
        
        ViewUpanimateMoving(up: false, upValue: 150)
        let contentInset: UIEdgeInsets = UIEdgeInsets()
        self.scrollView.contentInset = contentInset
        keyBoardCount = 0
    }
    
    
    // Анимация
    
    func ViewUpanimateMoving (up:Bool, upValue :CGFloat){
        let durationMovement:TimeInterval = 0.4
        let movement:CGFloat = ( up ? -upValue : upValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(durationMovement)
        self.view.frame = self.view.frame.offsetBy(dx: 0,  dy: movement)
        UIView.commitAnimations()
    }
    
    @IBAction func imagePick1(_ sender:UITapGestureRecognizer) {
            self.imageImport()
            self.imageNum = 1
        }
    
    @IBAction func imagepick2(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        self.imageNum = 2
    }
    
    @IBAction func imagePick3(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        self.imageNum = 3
    }
    
    @IBAction func imagePick4(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        self.imageNum = 4
    }
    
    @IBAction func imagePick5(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        self.imageNum = 5
    }
    
    @IBAction func imagePick6(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        self.imageNum = 6
    }
    
    @IBAction func imagePick7(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        self.imageNum = 7
    }
    
    @IBAction func imagePick8(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        self.imageNum = 8
    }
    
    @IBAction func imagePick9(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        self.imageNum = 9
    }
    
    
    func imageImport() {
        let imagePickerControllerFirst = UIImagePickerController()
        imagePickerControllerFirst.sourceType = .photoLibrary
        imagePickerControllerFirst.delegate = self
        imagePickerControllerFirst.allowsEditing = true
        present(imagePickerControllerFirst, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage
    
        switch imageNum {
        case 1:
            photo1.image = pickedImage
        case 2:
            photo2.image = pickedImage
        case 3:
            photo3.image = pickedImage
        case 4:
            photo4.image = pickedImage
        case 5:
            photo5.image = pickedImage
        case 6:
            photo6.image = pickedImage
        case 7:
            photo7.image = pickedImage
        case 8:
            photo8.image = pickedImage
        case 9:
            photo9.image = pickedImage
        default:
            imageNum = 0
        }
        dismiss(animated: true, completion: nil)
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        
        if editing == true {
            photo1.isUserInteractionEnabled = true
            photo2.isUserInteractionEnabled = true
            photo3.isUserInteractionEnabled = true
            photo4.isUserInteractionEnabled = true
            photo5.isUserInteractionEnabled = true
            photo6.isUserInteractionEnabled = true
            photo7.isUserInteractionEnabled = true
            photo8.isUserInteractionEnabled = true
            photo9.isUserInteractionEnabled = true
            mealIngredients.isEditable = true
            mealIngredientsNum.isEditable = true
            mealNotes.isEditable = true
            preparingMeal.isEditable = true
        }
        else {
            if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
            }
            photo1.isUserInteractionEnabled = false
            photo2.isUserInteractionEnabled = false
            photo3.isUserInteractionEnabled = false
            photo4.isUserInteractionEnabled = false
            photo5.isUserInteractionEnabled = false
            photo6.isUserInteractionEnabled = false
            photo7.isUserInteractionEnabled = false
            photo8.isUserInteractionEnabled = false
            photo9.isUserInteractionEnabled = false
            mealIngredients.isEditable = false
            mealIngredientsNum.isEditable = false
            mealNotes.isEditable = false
            preparingMeal.isEditable = false
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
