//
//  ProfileCollectionCollectionViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/8/22.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static var identifier = "ProfileCollectionViewCell"
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView ()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(debug imageName: UIImage){
        photoImageView.image = imageName
    }
}
