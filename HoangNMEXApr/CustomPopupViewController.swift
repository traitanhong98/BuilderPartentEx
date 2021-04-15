//
//  CustomPopupViewController.swift
//  HoangNMEXApr
//
//  Created by Hoang on 4/14/21.
//  Copyright © 2021 Hoang. All rights reserved.
//

import UIKit



protocol PersonBuilder {
    func setName(name: String) -> PersonBuilder
    func setAge(age: String) -> PersonBuilder
    func setDes(des: String) -> PersonBuilder
    func build() -> Person
}

class Person: PersonBuilder {
    func build() -> Person {
        return self
    }
    
    func setName(name: String) -> PersonBuilder {
        self.name = name
        return self
    }
    
    func setAge(age: String) -> PersonBuilder {
        self.age = age
        return self
    }
    
    func setDes(des: String) -> PersonBuilder {
        self.des = des
        return self
    }
    
    var name = ""
    var age = ""
    var des = ""
}

class CustomPopupViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    
    var person = Person()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = person.name
        ageLabel.text = person.age
        desLabel.text = person.des
    }
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
