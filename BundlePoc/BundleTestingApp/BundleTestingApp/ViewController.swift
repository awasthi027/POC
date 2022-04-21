//
//  ViewController.swift
//  BundleTestingApp
//
//  Created by Ashish Awasthi on 4/21/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.launchControllerFromCustomerBundle()
        // Do any additional setup after loading the view.
    }
    
    func launchControllerFromCustomerBundle() {
        let allBundles = Bundle.allBundles
        var url: URL? = nil
        for bundle in allBundles  {
            if let item  = bundle.url(forResource: "ImageAndStoryBoard", withExtension: "bundle") {
                url = item
                break
            }
        }
        if let item = url {
            let bundle = Bundle.init(url: item)
            DataManager.setUp(withDataModelName: "Gen5Data", bundle: bundle ?? .main, persistentStoreName: "Gen5Data")
            self.saveDataInCoreDataBundle()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
                let controller = UIStoryboard.init(name: "Main", bundle: bundle).instantiateViewController(withIdentifier: "ViewController")
                self.present(controller, animated: true) {
                    self.retriveTheData()
                }
            }
        }
    }
    
    func saveDataInCoreDataBundle() {
        guard let userEntity = NSEntityDescription.entity(forEntityName: "User", in: DataManager.mainContext) else { return }
        for i in 1...5 {
            let user =  NSManagedObject(entity: userEntity, insertInto: DataManager.mainContext)
            user.setValue("A-\(i)02, Godrej Air", forKey: "address")
            user.setValue("mps\(i)@yopmail.com", forKey: "name")
        }
        do {
            try DataManager.mainContext.save()
            debugPrint("Data saved")
        } catch let error as NSError {
            debugPrint(error)
        }
    }
    
    func retriveTheData() {
        let results = DataManager.fetchObjects(entity: User.self,  context: DataManager.mainContext)
        debugPrint("Saved values")
        for data in results {
            debugPrint(data.value(forKey: "name") as? String ?? "")
        }
    }
}

@objc(User)
public class User: NSManagedObject {
}

