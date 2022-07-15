//
//  OtherProfileTabCollectionReusableView.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/14/22.
//

import UIKit

class OtherProfileTabCollectionReusableView: UICollectionReusableView {

    static var identifier = "OtherProfileTabCollectionReusableView"
    
    static func nib() -> UINib {
        return UINib(nibName: "OtherProfileTabCollectionReusableView", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .gray
    }
    
}
