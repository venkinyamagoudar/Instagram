//
//  MessageTableCellViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/9/22.
//

import Foundation
import UIKit

protocol MessageTableViewCellDelegate : AnyObject {
    func didTapCameraButton()
}

class MessageTableCellViewModel {
    public weak var cameraDelegate: MessageTableViewCellDelegate?
    
    func setProfileImage(_ profileImageView: UIImageView){
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }
}
