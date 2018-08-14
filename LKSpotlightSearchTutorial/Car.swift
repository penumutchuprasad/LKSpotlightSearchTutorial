//Car.swift
/*
 * LKSpotlightSearchTutorial
 * Created by penumutchu.prasad@gmail.com on 14/08/18
 * Is a product created by abnboys
 * For the LKSpotlightSearchTutorial in the LKSpotlightSearchTutorial
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit


struct Car {
    
    var brand: String
    var image: UIImage
    
    var imageName: String
    
}

extension Car {
    
    init(dict: [String: String]) {
        self.brand = dict["brand"]!
        self.image = UIImage.init(named: dict["image"]!)!
        self.imageName = dict["image"]!
    }
}
