//
//  MessageTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/29/22.
//

import UIKit

protocol MessageTableViewCellDelegate : AnyObject {
    func didTapCameraButton()
}
class MessageTableViewCell: UITableViewCell {

    static var identifier = "MessageCell"
    
    @IBOutlet weak var senderProfileName: UILabel!
    @IBOutlet weak var senderProfilePicture: UIImageView!
    @IBOutlet weak var lastSeen: UILabel!
    
    public weak var cameraDelegate: MessageTableViewCellDelegate?
    
    static func nib() -> UINib {
        return UINib(nibName: "MessageTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func cameraButtonTapped(_ sender: Any) {
        print("Camera button pressed")
        cameraDelegate?.didTapCameraButton()
    }
    
}
