//
//  ViewController.swift
//  projectmeal
//
//  Created by Nick on 28.07.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    //Работа с Image
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ImageView2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Анимация стрелок на главном экране
        
        //Левая стрелка
        ImageView.animationImages = [UIImage(named: "Image1-4")!,UIImage(named: "Image1-5")!,UIImage(named: "Image1-6")!,UIImage(named: "Image1-7")!,UIImage(named: "Image1-7")!,UIImage(named: "Image1-6")!,UIImage(named: "Image1-5")!,UIImage(named: "Image1-4")!]
        ImageView.animationDuration = 1.2
        ImageView.startAnimating()
        
        //Правая стрелка
        ImageView2.animationImages = [UIImage(named: "Image2-4")!,UIImage(named: "Image2-5")!,UIImage(named: "Image2-6")!,UIImage(named: "Image2-7")!,UIImage(named: "Image2-7")!,UIImage(named: "Image2-6")!,UIImage(named: "Image2-5")!,UIImage(named: "Image2-4")!]
        ImageView2.animationDuration = 1.2
        ImageView2.startAnimating()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

