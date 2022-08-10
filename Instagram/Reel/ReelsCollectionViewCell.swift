//
//  ReelsCollectionViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/1/22.
//

import UIKit
import AVFoundation


class ReelsCollectionViewCell: UICollectionViewCell {

    static var identifier = "ReelCollectionCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ReelsCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var reelView: UIView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!

    let reelCollectionViewModel = ReelCollectionViewModel()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        reelView.isUserInteractionEnabled = true
        reelView.addGestureRecognizer(tapGesture)
        
        reelCollectionViewModel.player?.isMuted = false
    }
    
    @objc func cellTapped(){
        reelCollectionViewModel.mute()
    }
    
    func configure(model: ReelCreator){
        reelCollectionViewModel.configure(model: model, username: userNameLabel, userProfileimageView: profileImageView)
    }
    
    @IBAction func moreButton(_ sender: Any) {
        print("more button")
        self.reelCollectionViewModel.reelsCellDelegate?.didTapMoreButton()
    }
    
    @IBAction func forwardButton(_ sender: Any) {
        print("forward button")
        self.reelCollectionViewModel.reelsCellDelegate?.didTapForwardButton()
    }
    
    @IBAction func commntButton(_ sender: Any) {
        print("comment button")
        self.reelCollectionViewModel.reelsCellDelegate?.didTapCommentButton()
    }
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        print("likeButton")
        reelCollectionViewModel.likeButtonTapped(self.likeButton)
    }
}
