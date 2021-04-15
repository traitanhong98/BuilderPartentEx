//
//  ViewController.swift
//  HoangNMEXApr
//
//  Created by Hoang on 4/14/21.
//  Copyright © 2021 Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let dataModel = DataModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func downloadAction(_ sender: Any) {
        self.dataModel.getListAlbum { [weak self] in
            guard let self = self else { return }
            self.dataModel.listDumpAlbums = self.dataModel.listAlbums.map({return ($0.clone() ?? Album())})
            self.dataModel.listDumpAlbums.forEach( {$0.title = "Hello"})
            self.dataModel.listAlbums.forEach( {print($0.des())})
            self.dataModel.listDumpAlbums.forEach( {print($0.des())})
        }
    }
    @IBAction func popupAction(_ sender: Any) {
        let person = Person.init().setName(name: "Hoang").setAge(age: "23").setDes(des: "Vui tinh").build()
        let popup = CustomPopupViewController()
        popup.view.frame = self.view.bounds
        popup.person = person
        popup.modalPresentationStyle = .overFullScreen
        popup.modalTransitionStyle = .coverVertical
        self.present(popup, animated: true, completion: nil)
    }
}

