//CarListCell.swift
/*
 * LKSpotlightSearchTutorial
 * Created by penumutchu.prasad@gmail.com on 14/08/18
 * Is a product created by abnboys
 * For the LKSpotlightSearchTutorial in the LKSpotlightSearchTutorial
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

class CarListCell: UITableViewCell {
    
    @IBOutlet var carImgView: UIImageView!
    @IBOutlet var carBrandLbl: UILabel!
    
    
    var car: Car! {
        
        didSet{
            
            self.carBrandLbl.text = car.brand
            self.carImgView.image = car.image
            
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        
        
    }
    
    
    
    
}
