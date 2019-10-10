//
//  JLImageCollectionViewCell.swift
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class JLImageCollectionViewCell: UICollectionViewCell {
    
    var breed: JLBreed? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var dogImageView: UIImageView!
    
    func updateViews() {
        
    }
}
