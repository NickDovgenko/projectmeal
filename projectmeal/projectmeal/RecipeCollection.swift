//
//  RecipeCollection.swift
//  Мои рецепты
//
//  Created by Nick on 04.10.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 10.0, *)
class RecipeCollection: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,NSFetchedResultsControllerDelegate {

    @IBOutlet weak var collectionCustomView: UICollectionView!
    var recipes: [Recipe] = []
    var filterRecipes: [Recipe] = []
    var deliverRecipe = [NSManagedObject]()
    var request: NSFetchedResultsController<Recipe>!
    var menuView: BTNavigationDropdownMenu!
    var menuSelected: String = "Все рецепты"
    
    
    @IBAction func dismissController(_ sender: UISwipeGestureRecognizer) {
        self.dismiss(animated: true, completion: {})
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let items = ["Все рецепты", "Избранное", "Первые блюда", "Вторые блюда", "Салаты", "Закуски", "Десерты", "Напитки", "Разное"]
        //Прозрачный Navigation bar
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
 
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: "Все рецепты", items: items as [AnyObject])
        menuView.cellHeight = 50
        menuView.cellBackgroundColor = self.navigationController?.navigationBar.barTintColor
        menuView.cellSelectionColor = UIColor(red: 0.0/255.0, green:0.0/255.0, blue:0.0/255.0, alpha: 0.3)
        menuView.shouldKeepSelectedCellColor = true
        menuView.cellTextLabelColor = UIColor.white
        menuView.cellTextLabelAlignment = .center
        menuView.arrowPadding = 15
        menuView.animationDuration = 0.5
        menuView.maskBackgroundColor = UIColor.black
        menuView.maskBackgroundOpacity = 0.3
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            print("Did select item at index: \(indexPath)")
            
            if items[indexPath] == "Все рецепты" {
                self.menuSelected = items[indexPath]
                self.filterContentForSearchText(searchText: self.menuSelected)
                print(self.menuSelected)
            }
            else if items[indexPath] == "Избранное" {
                self.menuSelected = items[indexPath]
                self.filterContentForSearchText(searchText: self.menuSelected)
                print(self.menuSelected)
            }
            else if items[indexPath] == "Первые блюда" {
                self.menuSelected = items[indexPath]
                self.filterContentForSearchText(searchText: self.menuSelected)
                print(self.menuSelected)
            }
            else if items[indexPath] == "Вторые блюда" {
                self.menuSelected = items[indexPath]
                self.filterContentForSearchText(searchText: self.menuSelected)
                print(self.menuSelected)
            }
            else if items[indexPath] == "Салаты" {
                self.menuSelected = items[indexPath]
                self.filterContentForSearchText(searchText: self.menuSelected)
                print(self.menuSelected)
            }
            else if items[indexPath] == "Закуски" {
                self.menuSelected = items[indexPath]
                self.filterContentForSearchText(searchText: self.menuSelected)
                print(self.menuSelected)
            }
            else if items[indexPath] == "Десерты" {
                self.menuSelected = items[indexPath]
                self.filterContentForSearchText(searchText: self.menuSelected)
                print(self.menuSelected)
            }
            else if items[indexPath] == "Напитки" {
                self.menuSelected = items[indexPath]
                self.filterContentForSearchText(searchText: self.menuSelected)
                print(self.menuSelected)
            }
            else if items[indexPath] == "Разное" {
                self.menuSelected = items[indexPath]
                self.filterContentForSearchText(searchText: self.menuSelected)
                print(self.menuSelected)
            }
        }
    
        
        self.navigationItem.titleView = menuView

        self.automaticallyAdjustsScrollViewInsets = false
        self.collectionCustomView.contentInset = UIEdgeInsets(top: 60, left: 20, bottom: 30, right: 20)
        
        let fetchRequest = NSFetchRequest<Recipe>(entityName: "Recipe")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
            
           request = NSFetchedResultsController(fetchRequest: fetchRequest , managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
           request.delegate = self
            
            do {
              try request.performFetch()
                recipes = request.fetchedObjects!
            } catch {
                print("Ошибка")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func filterContentForSearchText(searchText: String) {
        if searchText != "Избранное" {
        filterRecipes = recipes.filter { recipe in
            return recipe.type.lowercased().contains(searchText.lowercased())
            }
        }
        else {
            filterRecipes = recipes.filter { recipe in
                return recipe.favorite == true
            }
        }
            self.collectionCustomView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if menuSelected != "Все рецепты"  {
            return self.filterRecipes.count
        }
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! RecipeCollectionViewCell
        if menuSelected == "Все рецепты" {
        cell.recipeName.text = self.recipes[indexPath.item].name
        cell.recipeImage.image = UIImage(data: recipes[indexPath.item].photo1 as! Data)
        cell.recipeImage.layer.cornerRadius = 20
        cell.recipeImage.clipsToBounds = true
        }
        else {
            cell.recipeName.text = self.filterRecipes[indexPath.item].name
            cell.recipeImage.image = UIImage(data: filterRecipes[indexPath.item].photo1 as! Data)
            cell.recipeImage.layer.cornerRadius = 20
            cell.recipeImage.clipsToBounds = true
        }
        return cell
    }
    
    // Выбор ячейки
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if menuSelected == "Все рецепты" {
            deliverRecipe = [recipes[indexPath.item]]
        }
        else {
            deliverRecipe = [filterRecipes[indexPath.item]]
        }
        self.performSegue(withIdentifier: "detailView", sender: indexPath)
        print(deliverRecipe)
    }
    
    // Переход в Detail View
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailView" {
            let secondScene: DetailViewController = segue.destination as! DetailViewController            
            secondScene.recipe = deliverRecipe 
            print("RecipesList", recipes)
        }
        
    }
    
    func itemSelected(withIndex: Int, name: String) {
        print("\(name) selected");
    }
    
    
    
}
