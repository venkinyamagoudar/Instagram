//
//  PersonalInformationTableCellViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/10/22.
//

import Foundation

protocol PersonalInformationTableViewCellDelegate : Any{
    func assigninfTextField(textField: String,indexPath: IndexPath)
}

class PersonalInformationTableCellViewModel{
    
    var enteredText: String!
    var indexPath: IndexPath!
    
    public var personalDelegate : PersonalInformationTableViewCellDelegate?
}
