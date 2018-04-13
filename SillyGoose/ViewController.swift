//
//  ViewController.swift
//  SillyGoose
//
//  Created by James Gillin on 4/13/18.
//  Copyright © 2018 internetandbeer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private let kittenImageStrings = ["https://www.yourcat.co.uk/images/legacy/catimages/Breed_AmericanCurl/healthykittenmain.jpg",
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL00V5B6tqRqGgHdH0l0Bte59aYgxjYbVdadB7EEVzM8VvkHEt",
                                      "https://pbs.twimg.com/profile_images/756320100483858432/OX50XkO__400x400.jpg",
                                      "https://static1.squarespace.com/static/54e8ba93e4b07c3f655b452e/t/57bbd1158419c2441f753542/1471927484433/"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName: "ProtoTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ProtoCell")
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProtoCell", for: indexPath) as? ProtoTableViewCell else { return UITableViewCell() }
        cell.imageURLString = kittenImageStrings[indexPath.row % 4]
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }

}

