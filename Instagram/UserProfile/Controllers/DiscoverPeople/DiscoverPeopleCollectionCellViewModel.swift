//
//  DiscoverPeopleCollectionCellViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/9/22.
//

import Foundation
import UIKit

class DiscoverPeopleCollectionCellViewModel{
    
    func setImageView(_ imageView: UIImageView){
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.width / 2
    }
}
