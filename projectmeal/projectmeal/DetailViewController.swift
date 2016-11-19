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
    var favorite = false
    
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
    @IBOutlet weak var favoriteButton: UIButton!
    

    var recipe = [NSManagedObject]()
    
    @IBAction func deleteRecipe(_ sender: UIBarButtonItem) {
            let alertController = UIAlertController(title: "Внимание!", message: "Вы действительно хотите удалить рецепт?", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive)
            { ACTION -> Void in
                if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
                    do {
                        _ = try managedObjectContext.execute(fetchRequest)
                        managedObjectContext.delete(self.recipe[0])
                    }
                    catch {
                        print("error")
                        return
                    }
                }
                self.dismiss(animated: true, completion: nil)
            })
        alertController.addAction(UIAlertAction(title: "Отмена", style: UIAlertActionStyle.cancel, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        return
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Кнопка избранное
        favoriteButton.addTarget(self, action: #selector(clickFavorite), for: .touchUpInside)
        self.buttonImage()
        
        print(recipe)
        
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
        self.photo1.image = UIImage(data: recipe[0].value(forKey: "photo1") as! Data)
        photo1.layer.cornerRadius = 20
        photo1.clipsToBounds = true
        self.photo2.image = UIImage(data: recipe[0].value(forKey: "photo2") as! Data)
        photo2.layer.cornerRadius = 20
        photo2.clipsToBounds = true
        self.photo3.image = UIImage(data: recipe[0].value(forKey: "photo3") as! Data)
        photo3.layer.cornerRadius = 20
        photo3.clipsToBounds = true
        self.photo4.image = UIImage(data: recipe[0].value(forKey: "photo4") as! Data)
        photo4.layer.cornerRadius = 20
        photo4.clipsToBounds = true
        self.photo5.image = UIImage(data: recipe[0].value(forKey: "photo5") as! Data)
        photo5.layer.cornerRadius = 20
        photo5.clipsToBounds = true
        self.photo6.image = UIImage(data: recipe[0].value(forKey: "photo6") as! Data)
        photo6.layer.cornerRadius = 20
        photo6.clipsToBounds = true
        self.photo7.image = UIImage(data: recipe[0].value(forKey: "photo7") as! Data)
        photo7.layer.cornerRadius = 20
        photo7.clipsToBounds = true
        self.photo8.image = UIImage(data: recipe[0].value(forKey: "photo8") as! Data)
        photo8.layer.cornerRadius = 20
        photo8.clipsToBounds = true
        self.photo9.image = UIImage(data: recipe[0].value(forKey: "photo9") as! Data)
        photo9.layer.cornerRadius = 20
        photo9.clipsToBounds = true
        
        self.navigationItem.title = recipe[0].value(forKey: "name") as! String?
        self.recipeType?.text = recipe[0].value(forKey: "type") as! String?
        self.mealIngredients?.text = recipe[0].value(forKey: "ingredient") as! String?
        self.mealIngredientsNum?.text = recipe[0].value(forKey: "ingredintNum") as! String?
        self.preparingMeal?.text = recipe[0].value(forKey: "cooking") as! String?
        self.mealNotes?.text = recipe[0].value(forKey: "note") as! String?
        
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
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
                do {
                    _ = try managedObjectContext.execute(fetchRequest)
                    
                    let managedObject = recipe
                    let mealIngredientsNumText = mealIngredientsNum?.text
                    let mealIngredientsText = mealIngredients?.text
                    let mealNotesText = mealNotes?.text
                    let mealCookingText = preparingMeal?.text
                    
                    if let recipePhoto = photo1.image {
                        managedObject[0].setValue(UIImagePNGRepresentation(recipePhoto) as NSData?, forKey: "photo1")
                    }
                    if let recipePhoto = photo2.image {
                        managedObject[0].setValue(UIImagePNGRepresentation(recipePhoto) as NSData?, forKey: "photo2")
                    }
                    if let recipePhoto = photo3.image {
                        managedObject[0].setValue(UIImagePNGRepresentation(recipePhoto) as NSData?, forKey: "photo3")
                    }
                    if let recipePhoto = photo4.image {
                        managedObject[0].setValue(UIImagePNGRepresentation(recipePhoto) as NSData?, forKey: "photo4")
                    }
                    if let recipePhoto = photo5.image {
                        managedObject[0].setValue(UIImagePNGRepresentation(recipePhoto) as NSData?, forKey: "photo5")
                    }
                    if let recipePhoto = photo6.image {
                        managedObject[0].setValue(UIImagePNGRepresentation(recipePhoto) as NSData?, forKey: "photo6")
                    }
                    if let recipePhoto = photo7.image {
                        managedObject[0].setValue(UIImagePNGRepresentation(recipePhoto) as NSData?, forKey: "photo7")
                    }
                    if let recipePhoto = photo8.image {
                        managedObject[0].setValue(UIImagePNGRepresentation(recipePhoto) as NSData?, forKey: "photo8")
                    }
                    if let recipePhoto = photo9.image {
                        managedObject[0].setValue(UIImagePNGRepresentation(recipePhoto) as NSData?, forKey: "photo9")
                    }
                    
                    managedObject[0].setValue(mealIngredientsNumText, forKey: "ingredintNum")
                    managedObject[0].setValue(mealNotesText, forKey: "note")
                    managedObject[0].setValue(mealIngredientsText, forKey: "ingredient")
                    managedObject[0].setValue(mealCookingText, forKey: "cooking")
                    
                        try managedObjectContext.save()
                }
                    catch {
                        print("error")
                        return
                    }
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
    
    func clickFavorite() {
        print(favorite)
        var variableFavoritee: Bool?
        variableFavoritee = recipe[0].value(forKey: "favorite") as! Bool?
        if  variableFavoritee == favorite || variableFavoritee == nil {
            favorite = true
            if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
                do {
                    _ = try managedObjectContext.execute(fetchRequest)
                    recipe[0].setValue(favorite, forKey: "favorite")
                    try managedObjectContext.save()
                }
                catch {
                    print("error")
                    return
                }
                let image = UIImage(named: "filledStar")
                favoriteButton.setImage(image, for: .normal)
                favorite = false
                let alertController = UIAlertController(title: "Добавлено в избранное", message: "", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default))
                self.present(alertController, animated: true, completion: nil)
                
            }
        }
        else {
            favorite = false
            if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
                do {
                    _ = try managedObjectContext.execute(fetchRequest)
                    recipe[0].setValue(favorite, forKey: "favorite")
                    try managedObjectContext.save()
                }
                catch {
                    print("error")
                    return
                }
                let image = UIImage(named: "emptyStar")
                favoriteButton.setImage(image, for: .normal)
                let alertController = UIAlertController(title: "Удалено из избранного", message: "", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default))
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    
    func buttonImage() {
        var variableFavoritee: Bool?
        variableFavoritee = recipe[0].value(forKey: "favorite") as! Bool?
        if  variableFavoritee == favorite || variableFavoritee == nil {
            let image = UIImage(named: "emptyStar")
            favoriteButton.setImage(image, for: .normal)
        }
        else {
            let image = UIImage(named: "filledStar")
            favoriteButton.setImage(image, for: .normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
