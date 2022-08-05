//
//  PersonalInformationTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/19/22.
//

import UIKit

protocol PersonalInformationTableViewCellDelegate {
    static var textField: UITextField { get }
}

class PersonalInformationTableViewCell: UITableViewCell {

    static var identifier = "PersonalInformationTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "PersonalInformationTableViewCell", bundle: nil)
    }
    
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    public var personalDelegate : PersonalInformationTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
