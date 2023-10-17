//
//  ViewController.swift
//  UserDefault
//
//  Created by Ahmet Erkut on 18.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Decleration
        let ud = UserDefaults.standard
        
        // Set
        ud.set("Erkut", forKey: "name")
        ud.set(21, forKey: "age")
        ud.set(1.88, forKey: "height")
        ud.set(true, forKey: "single")
        
        let list = ["ali", "veli"]
        ud.set(list, forKey: "list")
        
        let cities = ["16":"Bursa", "34":"Istanbul"] // dictionary must be [String:String]
        ud.set(cities, forKey: "dictionary")
        
        // Delete
        //ud.removeObject(forKey: "name")
        
        // Get
        let getName = ud.string(forKey: "name") ?? "No name"
        let getAge = ud.integer(forKey: "age") // intiger has default value -> 0
        let getHeight = ud.double(forKey: "height") // double has default value -> 0.0
        let getSingle = ud.bool(forKey: "single") // bool has default value -> false
        print("Get Name: \(getName)")
        print("Get Age: \(getAge)")
        print("Get Height: \(getHeight)")
        print("Get Single: \(getSingle)")
        
        let getList = ud.array(forKey: "list") ?? [String]()
        
        for a in getList {
            print("Get List: \(a)")
        }
        
        let getDictionary = ud.dictionary(forKey: "dictionary") ?? [String:String]()
        
        for (key,value) in getDictionary {
            print("Get Dictionary: \(key) -> \(value)")
        }
        
        
        // Var Open Counter App
        
        var counter = ud.integer(forKey: "counter") // 0
        
        counter += 1
        
        ud.set(counter, forKey: "counter")
        
        countLabel.text = "Open Count: \(counter)"
        
    }
}

