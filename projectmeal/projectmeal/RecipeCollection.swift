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
    var request: NSFetchedResultsController<Recipe>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.collectionCustomView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! RecipeCollectionViewCell
        cell.recipeName.text = self.recipes[indexPath.item].name
        cell.recipeImage.image = UIImage(data: recipes[indexPath.item].photo1 as! Data)
        cell.recipeImage.layer.cornerRadius = 20
        cell.recipeImage.clipsToBounds = true
        
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }

    
}
