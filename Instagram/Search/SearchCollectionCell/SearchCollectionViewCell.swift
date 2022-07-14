//
//  SearchCollectionViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/30/22.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    
    static var identifier = "SearchCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "SearchCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
