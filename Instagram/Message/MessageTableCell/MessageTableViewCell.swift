//
//  MessageTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/29/22.
//

import UIKit


class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var senderProfileName: UILabel!
    @IBOutlet weak var senderProfilePicture: UIImageView!
    @IBOutlet weak var lastSeen: UILabel!
    
    var messageTableCellViewModel = MessageTableCellViewModel()
    
    static var identifier = "MessageCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MessageTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
            messageTableCellViewModel.setProfileImage(senderProfilePicture)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func cameraButtonTapped(_ sender: Any) {
            messageTableCellViewModel.cameraDelegate?.didTapCameraButton()
    }
    
}
