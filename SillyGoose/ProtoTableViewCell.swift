//
//  ProtoTableViewCell.swift
//  SillyGoose
//
//  Created by James Gillin on 4/13/18.
//  Copyright © 2018 internetandbeer. All rights reserved.
//

import UIKit
import Alamofire

class ProtoTableViewCell: UITableViewCell {

    @IBOutlet weak var largeImage: UIImageView!
    var imageURLString: String? {
        didSet {
            outstandingRequest?.cancel()
            downloadMyImage()
        }
    }
    var outstandingRequest: DataRequest?
    
    
    func downloadMyImage() {
        guard let imageURLString = self.imageURLString else { return }
        outstandingRequest = Alamofire.request(imageURLString).responseData { [weak self] (dataResponse)  in
            if let data = dataResponse.value {
                let kitten = UIImage(data: data)
                self?.largeImage.image = kitten
            }
        }
    }
    
}
