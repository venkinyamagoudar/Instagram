//
//  OtherProfileCollectionViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/14/22.
//

import UIKit

class OtherProfileCollectionViewCell: UICollectionViewCell {

    
    static var identifier = "OtherProfileCollectionViewCell"
    
    @IBOutlet weak var photoImageView: UIImageView!
    //    private let photoImageView: UIImageView = {
//        let imageView = UIImageView ()
//        imageView.clipsToBounds = true
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        photoImageView.frame = contentView.bounds
//    }
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        photoImageView.image = nil
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.backgroundColor = .secondarySystemBackground
//        contentView.addSubview(photoImageView)
//        contentView.clipsToBounds = true
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    public func configure(with model: UserPost) {
        let url = model.thumbNailImage
        _ = URLSession.shared.dataTask(with: url, completionHandler: { [self] data, _, _ in
            photoImageView.image = UIImage(data: data!)
            
        })
    }
    
    public func configure(debug imageName: String){
        photoImageView.image = UIImage(named: imageName)
    }

}
