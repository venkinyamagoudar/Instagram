//
//  ReelCollectionViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/9/22.
//

import Foundation
import AVFoundation
import UIKit

protocol ReelsCollectionViewCellDelegate: AnyObject{
    func didTapMoreButton()
    func didTapForwardButton()
    func didTapCommentButton()
}


class ReelCollectionViewModel{
    
    var reelCreatorIncell: ReelCreator!
    
    var player: AVPlayer?
    var avPlayerLayer: AVPlayerLayer?
    var a = true
    
    public var reelsCellDelegate : ReelsCollectionViewCellDelegate?
    
    func mute() {
        if !player!.isMuted {
            player?.isMuted = true
        } else if player!.isMuted{
            player?.isMuted = false
        }
    }
    
    func likeButtonTapped(_ likeButton: UIButton){
        if a{
            a = false
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            a = true
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
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
    
    func configure(model: ReelCreator, username: UILabel, userProfileimageView: UIImageView){
        self.reelCreatorIncell = model
        userProfileimageView.image = getImageData(imageURL: model.profile_pic_url)
        username.text = model.username
    
    }
}
