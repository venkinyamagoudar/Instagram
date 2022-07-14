//
//  ShoppingCollectionViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/5/22.
//

import UIKit

class ShoppingCollectionViewCell: UICollectionViewCell {

    static var identifier = "ShopCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ShoppingCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var itemPhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
