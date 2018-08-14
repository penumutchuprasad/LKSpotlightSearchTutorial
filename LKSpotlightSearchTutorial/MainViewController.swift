//ViewController.swift
/*
 * LKSpotlightSearchTutorial
 * Created by penumutchu.prasad@gmail.com on 14/08/18
 * Is a product created by abnboys
 * For the  in the LKSpotlightSearchTutorial
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit
import CoreSpotlight
import MobileCoreServices

class MainViewController: UITableViewController {
    
    
    let cellId = "TableViewCell"
    let segueID = "toDetailVC"
    var carList = [Car]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadCarsList()
        tableView.separatorStyle = .none
        
        self.setupSearchableContent()
    }

    func loadCarsList() {
        
        if let path = Bundle.main.path(forResource: "Datasource", ofType: "plist") {
            
            if let content = NSMutableArray.init(contentsOfFile: path) {
                
                self.carList = content.map({ Car.init(dict: $0 as! [String : String]) })
                tableView.reloadData()

            }
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueID {
            
            if let indexPath = sender as? IndexPath, let dest = segue.destination as? DetailVC {
                
                let selectedCar = carList[indexPath.row]
                dest.car = selectedCar
                
            }
            
        }
        
        
    }
    
    //MARK: Setup Searchable Content for our app
    func setupSearchableContent() {
        
        //1. We declared an array to collect all the searchable items
        // We index the data for the spotlight by using this array
        var searchableItems = [CSSearchableItem]()
        
        //Now we will create a CSSearchableItemAttributeSet object for each Car object in our model and then
        //We give the values for that attributes for that CSSearchableItemAttributeSet object
        
        //To access each car object
        for (index,car) in carList.enumerated() {
            
            let searchableItemAttributeSet = CSSearchableItemAttributeSet.init() //init(itemContentType: kUTTypeText as String) //1st Thing TO DO
            
            //Set the values for the attributes
            
            //Set title
            searchableItemAttributeSet.title = car.brand
            
            //Set the image
            //Can be done in two ways
            // 1. by URL and 2. By data
            
            //in the following, I used a static method which will generate a URL from the asset images by placing them in the FileManager.Default().
            searchableItemAttributeSet.thumbnailURL = AssetExtractor.createLocalUrl(forImageNamed: car.imageName)
                                            //OR
           // searchableItemAttributeSet.thumbnailData = imageData //pass the image data, if it is from database or server
            searchableItemAttributeSet.contentType = kUTTypeText as String
            
          //You can pass many other attributes to this Set, please go to documentation for more on these
            
        /*    Now it’s time to set the keywords we want for spotting data from our app on the Spotlight. Think well before specifying keywords, as your decision is crucial for the discoverability of your app from the Spotlight and the user eventually. In this demo app we’re going to set as keywords both the brand that a car belongs to and its imageName.
 
             */
            var keywordsssss = [String]()
            keywordsssss.append(car.brand)
            keywordsssss.append(car.imageName)
            // We assigned our keywords array to the attributeset's keywords
            searchableItemAttributeSet.keywords = keywordsssss
            
            let uniqID = "\(Bundle.main.bundleIdentifier!).\(index)"
            
            let searchableItem = CSSearchableItem.init(uniqueIdentifier: uniqID, domainIdentifier: "cars", attributeSet: searchableItemAttributeSet) // 2nd Thing TO DO
            
            searchableItems.append(searchableItem) // 3rd Thing TO DO
            
        }
        
        // Index the data to the CoreSpotlight APi
        // last Thing TO DO
        CSSearchableIndex.default().indexSearchableItems(searchableItems) { (error) in
            
            if error != nil {
                print(error?.localizedDescription ?? "Spotlight search API error")
            }
            
        }
        
    }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        
        //Check the activity is that of type CSSearchableItemActionType first
        if activity.activityType == CSSearchableItemActionType {
            
            if let userInfo = activity.userInfo {
                // Get the identifier from the userInfo dictionary
                let selectedItemIdentifier = userInfo[CSSearchableItemActivityIdentifier] as! String
                //Get the index that we suffixed in the above method to the unique identifier
                let neededIndex = Int(selectedItemIdentifier.components(separatedBy: ".").last!)!
                //show the detail screen
                performSegue(withIdentifier: segueID, sender: IndexPath(row: neededIndex, section: 0))
                
                
            }
            
        }
        
    }

}

extension MainViewController {
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CarListCell
        
        cell.car = carList[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: segueID, sender: indexPath)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 125
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
























