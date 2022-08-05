//
//  ReelsCollectionViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/1/22.
//

import UIKit
import AVFoundation

protocol ReelsCollectionViewCellDelegate: AnyObject{
    func didTapMoreButton()
    func didTapForwardButton()
    func didTapCommentButton()
}

class ReelsCollectionViewCell: UICollectionViewCell {

    static var identifier = "ReelCollectionCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ReelsCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var reelView: UIView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!

    var reelCreatorIncell: ReelCreator!
    
    var player: AVPlayer?
    var avPlayerLayer: AVPlayerLayer?
    var a = true
    
    public var reelsCellDelegate : ReelsCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        reelView.isUserInteractionEnabled = true
        reelView.addGestureRecognizer(tapGesture)
        
        player?.isMuted = false
    }
    
    @objc func cellTapped(){
        mute()
    }
    
    func configure(model: ReelCreator){
        self.reelCreatorIncell = model
        profileImageView.image = getImageData(imageURL: model.profile_pic_url)
        userNameLabel.text = model.username
    
    }
    
    func mute() {
        if !player!.isMuted {
            player?.isMuted = true
        } else if player!.isMuted{
            player?.isMuted = false
        }
    }

    @IBAction func moreButton(_ sender: Any) {
        print("more button")
        self.reelsCellDelegate?.didTapMoreButton()
    }
    
    @IBAction func forwardButton(_ sender: Any) {
        print("forward button")
        self.reelsCellDelegate?.didTapForwardButton()
    }
    
    @IBAction func commntButton(_ sender: Any) {
        print("comment button")
        self.reelsCellDelegate?.didTapCommentButton()
    }
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        print("likeButton")
        
        if a{
            a = false
            self.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            a = true
            self.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    func getImageData(imageURL: URL) -> UIImage?{
        do {
            if let imageData = try? Data(contentsOf: imageURL){
                if let image = UIImage(data: imageData){
                    return image
                }
            }
        }catch{
            print("error in image \(error)")
        }
        return nil
    }
    
}
