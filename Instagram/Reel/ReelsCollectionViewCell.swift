//
//  ReelsCollectionViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/1/22.
//

import UIKit

class ReelsCollectionViewCell: UICollectionViewCell {

    static var identifier = "ReelCollectionCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!
    
    static func nib() -> UINib {
        return UINib(nibName: "ReelsCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func moreButton(_ sender: Any) {
        
        print("more button")
    }
    
    @IBAction func forwardButton(_ sender: Any) {
        print("forward button")
    }
    
    @IBAction func commntButton(_ sender: Any) {
        print("comment button")
    }
    
    @IBAction func likeButton(_ sender: Any) {
        print("like button")
    }
}
