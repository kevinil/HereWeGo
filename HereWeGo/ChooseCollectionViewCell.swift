//
//  ChooseCollectionViewCell.swift
//  HereWeGo
//
//  Created by 刘剑文 on 16/3/22.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class ChooseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView! {
        didSet {
            coverImageView.layer.cornerRadius = 5
            coverImageView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
}
