//
//  EditWebsiteTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/18/22.
//

import UIKit

class EditWebsiteTableViewCell: UITableViewCell {
    
    static let identifier = "EditWebsiteTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "EditWebsiteTableViewCell", bundle: nil)
    }
    @IBOutlet weak var firstLabel: UILabel!
    @IBAction func textField(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension EditWebsiteTableViewCell : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
