//
//  JLDetailViewController.swift
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class JLDetailViewController: UIViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var dogNameLabel: UILabel!
    
    @objc var dogImageURL: NSURL? {
        didSet{
            loadViewIfNeeded()
            JLBreedController.sharedInstance()?.fetchImageData(dogImageURL! as URL, completion: { (data, error) in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.dogImageView.image = UIImage(data: data)
                }
            })
        }
    }
    
    @objc var breed: JLBreed? {
        didSet {
            loadViewIfNeeded()
            dogNameLabel.text = breed?.name.capitalized
        }
    }
    
    @objc var subBreed: JLSubBreed?{
        didSet{
            loadViewIfNeeded()
            guard let subBreedName = subBreed?.name,
                let breedName = breed?.name else {return}
            dogNameLabel.text = "\(subBreedName) \(breedName)".capitalized
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
