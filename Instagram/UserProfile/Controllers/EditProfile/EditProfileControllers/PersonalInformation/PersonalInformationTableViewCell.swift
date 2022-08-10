//
//  PersonalInformationTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/19/22.
//

import UIKit


class PersonalInformationTableViewCell: UITableViewCell{

    static var identifier = "PersonalInformationTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "PersonalInformationTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var firstLabel: UILabel?
    @IBOutlet weak var textField: UITextField?
    
    var personalInformationTableCellViewModel = PersonalInformationTableCellViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField!.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PersonalInformationTableViewCell: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        personalInformationTableCellViewModel.enteredText = textField.text
        personalInformationTableCellViewModel.personalDelegate?.assigninfTextField(textField: personalInformationTableCellViewModel.enteredText, indexPath: personalInformationTableCellViewModel.indexPath)
    }
}
