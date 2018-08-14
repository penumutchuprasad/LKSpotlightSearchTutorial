//DetailVC.swift
/*
 * LKSpotlightSearchTutorial
 * Created by penumutchu.prasad@gmail.com on 14/08/18
 * Is a product created by abnboys
 * For the LKSpotlightSearchTutorial in the LKSpotlightSearchTutorial
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    var car: Car?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let car = car {
            
            brand.text = car.brand
            img.image = car.image
            
        }
        
    }
    
    
}
