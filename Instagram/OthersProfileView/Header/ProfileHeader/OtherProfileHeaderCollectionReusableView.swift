//
//  OtherProfileHeaderCollectionReusableView.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/14/22.
//

import UIKit

class OtherProfileHeaderCollectionReusableView: UICollectionReusableView {

    static var identifier = "OtherProfileHeaderCollectionReusableView"
    
    static func nib() -> UINib {
        return UINib(nibName: "OtherProfileHeaderCollectionReusableView", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .orange
    }
    
}
