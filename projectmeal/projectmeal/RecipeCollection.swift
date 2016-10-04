//
//  RecipeCollection.swift
//  Мои рецепты
//
//  Created by Nick on 04.10.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class RecipeCollection: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionCustomView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.collectionCustomView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    var items = ["Грибной суп", "Рыбка", "Каша", "Куриное филе", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! RecipeCollectionViewCell
        cell.recipeName.text = self.items[indexPath.item]
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }

    
}
