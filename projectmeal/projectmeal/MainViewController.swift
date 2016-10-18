//
//  ViewController.swift
//  projectmeal
//
//  Created by Nick on 28.07.16.
//  Copyright © 2016 Nick. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{
    
    //Работа с анимацией
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ImageView2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        _ = self.navigationController?.popToRootViewController(animated: false)
        
        //Белый статус бар
        UIApplication.shared.statusBarStyle = .lightContent
        
        //Анимация стрелок на главном экране
        
        //Левая стрелка
        ImageView.animationImages = [UIImage(named: "Image1-4")!,UIImage(named: "Image1-5")!,UIImage(named: "Image1-6")!,UIImage(named: "Image1-7")!,UIImage(named: "Image1-7")!,UIImage(named: "Image1-6")!,UIImage(named: "Image1-5")!,UIImage(named: "Image1-4")!]
        ImageView.animationDuration = 1.2
        ImageView.startAnimating()
        
        //Правая стрелка
        ImageView2.animationImages = [UIImage(named: "Image2-4")!,UIImage(named: "Image2-5")!,UIImage(named: "Image2-6")!,UIImage(named: "Image2-7")!,UIImage(named: "Image2-7")!,UIImage(named: "Image2-6")!,UIImage(named: "Image2-5")!,UIImage(named: "Image2-4")!]
        ImageView2.animationDuration = 1.2
        ImageView2.startAnimating()
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

    extension UIViewController {
        func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        }
    
        func dismissKeyboard() {
        view.endEditing(true)
        }
    }
