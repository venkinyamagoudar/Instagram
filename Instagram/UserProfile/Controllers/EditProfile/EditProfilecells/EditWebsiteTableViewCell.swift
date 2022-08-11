//
//  EditWebsiteTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/18/22.
//

import UIKit

protocol EditWebsiteTableViewCellDelegate: Any{
    func saveWebsite(text: String)
}

class EditWebsiteTableViewCell: UITableViewCell{
    
    static let identifier = "EditWebsiteTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "EditWebsiteTableViewCell", bundle: nil)
    }
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var editWebsiteTableViewCellDelegate: EditWebsiteTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension EditWebsiteTableViewCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        editWebsiteTableViewCellDelegate?.saveWebsite(text: textField.text!)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        editWebsiteTableViewCellDelegate?.saveWebsite(text: textField.text!)
    }
}
