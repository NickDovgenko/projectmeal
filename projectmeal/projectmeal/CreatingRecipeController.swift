//
//  CreatingRecipeController.swift
//  Мои рецепты
//
//  Created by Nick on 04.09.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit
import CoreData

class CreatingRecipeController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    
    var imageNum = 0
    var selectedRow = String()
    var recipe: Recipe!
    
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var newImage2: UIImageView!
    @IBOutlet weak var newImage3: UIImageView!
    @IBOutlet weak var newImage4: UIImageView!
    @IBOutlet weak var newImage5: UIImageView!
    @IBOutlet weak var newImage6: UIImageView!
    @IBOutlet weak var newImage7: UIImageView!
    @IBOutlet weak var newImage8: UIImageView!
    @IBOutlet weak var newImage9: UIImageView!
    @IBOutlet weak var textLabel: UITextField!
    @IBOutlet weak var mealList: UIPickerView!
    @IBOutlet weak var preparingMeal: UITextView!
    @IBOutlet weak var mealNotes: UITextView!
    @IBOutlet weak var mealIngredients: UITextView!
    @IBOutlet weak var mealIngredientsNum: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealList.dataSource = self
        mealList.delegate = self
        textLabel.delegate = self
        
        //Рамка текстовых полей
        
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
        
        //
     
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil)

        //Dismiss keyboard
        self.hideKeyboardWhenTappedAround()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
        //  UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
        //  Обработка нажатий на фото
    @IBAction func imagePick(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        imageNum = 1
    }
    @IBAction func imagePickTwo(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        imageNum = 2
    }
    @IBAction func imagePickThree(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        imageNum = 3
    }
    
    @IBAction func imagePickFour(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        imageNum = 4
    }
    
    @IBAction func imagePickFive(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        imageNum = 5
    }
    @IBAction func imagePickSix(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        imageNum = 6
    }
    
    @IBAction func imagePickSeven(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        imageNum = 7
    }
    
    @IBAction func imagePickEight(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        imageNum = 8
    }
    
    
    @IBAction func imagePickNine(_ sender: UITapGestureRecognizer) {
        self.imageImport()
        imageNum = 9
    }
    
    func imageImport() {
        let imagePickerControllerFirst = UIImagePickerController()
        imagePickerControllerFirst.sourceType = .photoLibrary
        imagePickerControllerFirst.delegate = self
        imagePickerControllerFirst.allowsEditing = true
        present(imagePickerControllerFirst, animated: true, completion: nil)
    }
    
    
        //Вывод фото из галереи
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage
        
        if imageNum == 1 {
            newImage.image = pickedImage
            newImage.layer.cornerRadius = 20
            newImage.clipsToBounds = true
        } else if imageNum == 2 {
            newImage2.image = pickedImage
            newImage2.layer.cornerRadius = 20
            newImage2.clipsToBounds = true
        } else if imageNum == 3 {
            newImage3.image = pickedImage
            newImage3.layer.cornerRadius = 20
            newImage3.clipsToBounds = true
        } else if imageNum == 4 {
            newImage4.image = pickedImage
            newImage4.layer.cornerRadius = 20
            newImage4.clipsToBounds = true
        } else if imageNum == 5 {
            newImage5.image = pickedImage
            newImage5.layer.cornerRadius = 20
            newImage5.clipsToBounds = true
        } else if imageNum == 6 {
            newImage6.image = pickedImage
            newImage6.layer.cornerRadius = 20
            newImage6.clipsToBounds = true
        } else if imageNum == 7 {
            newImage7.image = pickedImage
            newImage7.layer.cornerRadius = 20
            newImage7.clipsToBounds = true
        } else if imageNum == 8 {
            newImage8.image = pickedImage
            newImage8.layer.cornerRadius = 20
            newImage8.clipsToBounds = true
        } else if imageNum == 9 {
            newImage9.image = pickedImage
            newImage9.layer.cornerRadius = 20
            newImage9.clipsToBounds = true
        }
            dismiss(animated: true, completion: nil)
    }
    
    //Data picker
    
    let mealListPicker = ["Первые блюда", "Вторые блюда", "Салаты","Закуски","Десерты","Напитки","Разное"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mealListPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mealListPicker[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selectedRow = mealListPicker[row]
        
    }
    
    //Работа с клавиатурой
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textLabel.resignFirstResponder()
        return true
    }

    func keyboardWillShow(notification:NSNotification) {
        
        ViewUpanimateMoving(up: true, upValue: 100)
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset: UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scrollView.contentInset = contentInset
    }
    
    func keyboardWillHide(notification:NSNotification) {
        
        ViewUpanimateMoving(up: false, upValue: 100)
        let contentInset: UIEdgeInsets = UIEdgeInsets()
        self.scrollView.contentInset = contentInset
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
    
    //Сохранение рецепта
    
    @IBAction func recipeSave(_ sender: UIBarButtonItem)
    {
        
        //Текстовые поля
        
        let name = textLabel.text
        let cooking = preparingMeal.text
        let ingredient = mealIngredients.text
        let ingredientNum = mealIngredientsNum.text
        let note = mealNotes.text
        var type = ""
        if selectedRow == "" {
            type = "Первые блюда"
        }
        else {
            type = selectedRow
        }
        
        
        //Проверка введенного текста
        
        if name == "" {
            let alertController = UIAlertController(title: "Ошибка", message: "Пустое поле: 'Название рецепта' ", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        //Сохрание в Core Data
        
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
            recipe = NSEntityDescription.insertNewObject(forEntityName: "Recipe", into: managedObjectContext) as! Recipe
            
            recipe.name = name!
            recipe.type = type
            recipe.ingredient = ingredient
            recipe.ingredintNum = ingredientNum
            recipe.cooking = cooking
            recipe.note = note
            if let recipePhoto = newImage2.image {
                recipe.photo1 = UIImagePNGRepresentation(recipePhoto) as NSData?
            }
            if let recipePhoto = newImage.image {
                recipe.photo2 = UIImagePNGRepresentation(recipePhoto) as NSData?
            }
            if let recipePhoto = newImage3.image {
                recipe.photo3 = UIImagePNGRepresentation(recipePhoto) as NSData?
            }
            if let recipePhoto = newImage4.image {
                recipe.photo4 = UIImagePNGRepresentation(recipePhoto) as NSData?
            }
            if let recipePhoto = newImage5.image {
                recipe.photo5 = UIImagePNGRepresentation(recipePhoto) as NSData?
            }
            if let recipePhoto = newImage6.image {
                recipe.photo6 = UIImagePNGRepresentation(recipePhoto) as NSData?
            }
            if let recipePhoto = newImage7.image {
                recipe.photo7 = UIImagePNGRepresentation(recipePhoto) as NSData?
            }
            if let recipePhoto = newImage8.image {
                recipe.photo8 = UIImagePNGRepresentation(recipePhoto) as NSData?
            }
            if let recipePhoto = newImage9.image {
                recipe.photo9 = UIImagePNGRepresentation(recipePhoto) as NSData?
            }
        
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
                return
            }
            
            
        }
    
    }
}
