//
//  DetailViewController.swift
//  Мои рецепты
//
//  Created by Nick on 10.10.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {


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
    
    var recievedData: [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
        
        self.title = recievedData[0].name
        self.recipeType?.text = recievedData[0].type
        self.mealIngredients?.text = recievedData[0].ingredient
        self.mealIngredientsNum?.text = recievedData[0].ingredintNum
        self.preparingMeal?.text = recievedData[0].cooking
        self.mealNotes?.text = recievedData[0].note
        
        print("Массив", recievedData)
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
