//
//  EditWebsiteTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/18/22.
//

import UIKit

class EditWebsiteTableViewCell: UITableViewCell{
    
    static let identifier = "EditWebsiteTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "EditWebsiteTableViewCell", bundle: nil)
    }
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var editWebsiteTableCellViewModel = EditWebsiteTableCellViewModel()
    
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
        editWebsiteTableCellViewModel.editWebsiteTableViewCellDelegate?.saveWebsite(text: textField.text!)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        editWebsiteTableCellViewModel.editWebsiteTableViewCellDelegate?.saveWebsite(text: textField.text!)
    }
}
