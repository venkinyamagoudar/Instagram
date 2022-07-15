//
//  OtherProfileStoryCollectionReusableView.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/14/22.
//

import UIKit

class OtherProfileStoryCollectionReusableView: UICollectionReusableView {

    static var identifier = "OtherProfileStoryCollectionReusableView"
    
    static func nib() -> UINib {
        return UINib(nibName: "OtherProfileStoryCollectionReusableView", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .green
    }
    
}
